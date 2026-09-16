import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription> _cameras = [];
  int _cameraIndex = 0;
  String? _errorMessage;
  bool _isSwitchingCamera = false;
  int _cameraRequest = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera({CameraDescription? camera}) async {
    final request = ++_cameraRequest;
    try {
      if (_cameras.isEmpty) {
        _cameras = await availableCameras();
      }
      if (_cameras.isEmpty) {
        throw Exception('Kamera tidak ditemukan pada perangkat.');
      }

      if (camera == null) {
        _cameraIndex = _cameras.indexWhere(
          (item) => item.lensDirection == CameraLensDirection.back,
        );
        if (_cameraIndex < 0) _cameraIndex = 0;
      } else {
        _cameraIndex = _cameras.indexOf(camera);
      }

      final controller = CameraController(
        _cameras[_cameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      _controller = controller;
      _initializeControllerFuture = controller.initialize();
      await _initializeControllerFuture;
      if (!mounted || request != _cameraRequest) {
        await controller.dispose();
        return;
      }
      setState(() {});
    } on CameraException catch (error) {
      // Saat flip, kegagalan controller lama tidak ditampilkan sebagai layar merah.
      if (mounted && !_isSwitchingCamera) {
        setState(() {
          _errorMessage =
              'Kamera tidak dapat digunakan: ${error.description ?? error.code}';
        });
      }
    } catch (error) {
      if (mounted && !_isSwitchingCamera) {
        setState(() => _errorMessage = error.toString());
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2 || _isSwitchingCamera) return;

    final oldController = _controller;
    setState(() {
      _isSwitchingCamera = true;
      _errorMessage = null;
      _controller = null;
      _initializeControllerFuture = null;
    });

    await oldController?.dispose();

    final currentDirection = _cameras[_cameraIndex].lensDirection;
    final nextIndex = _cameras.indexWhere(
      (camera) =>
          camera.lensDirection != currentDirection &&
          camera.lensDirection != CameraLensDirection.external,
    );

    if (nextIndex >= 0) {
      await _initializeCamera(camera: _cameras[nextIndex]);
    }
    if (mounted) setState(() => _isSwitchingCamera = false);
  }

  Future<void> _takePicture() async {
    final controller = _controller;
    final initializeFuture = _initializeControllerFuture;
    if (controller == null || initializeFuture == null || _isSwitchingCamera) {
      return;
    }

    try {
      await initializeFuture;
      final photo = await controller.takePicture();
      await Gal.putImage(photo.path, album: 'Widget Dasar');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto berhasil disimpan ke galeri.')),
      );
    } on GalException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan foto: ${error.type}')),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal mengambil foto: $error')));
      }
    }
  }

  Widget _buildCameraPreview() {
    final controller = _controller;
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          // Jangan biarkan error sementara dari controller lama menjadi
          // halaman merah ketika kamera sedang berganti.
          return const ColoredBox(color: Colors.black);
        }
        if (snapshot.connectionState == ConnectionState.done &&
            controller != null &&
            controller.value.isInitialized) {
          // CameraPreview mengatur rasio preview sendiri. Jangan dibungkus
          // AspectRatio agar tampilan kembali memenuhi area kamera seperti
          // sebelumnya tanpa gambar menjadi gepeng.
          return CameraPreview(controller);
        }
        return const ColoredBox(
          color: Colors.black,
          child: Center(child: CircularProgressIndicator(color: Colors.white)),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kamera & Galeri')),
      body: _errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(_errorMessage!, textAlign: TextAlign.center),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _buildCameraPreview(),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: _isSwitchingCamera
                                ? null
                                : _switchCamera,
                            color: Colors.white,
                            tooltip: 'Balik kamera',
                            icon: const Icon(Icons.flip_camera_android),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    onTap: _takePicture,
                    child: Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(color: Colors.white, width: 5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
