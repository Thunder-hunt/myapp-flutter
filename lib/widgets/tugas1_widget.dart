import 'package:flutter/material.dart';

class Tugas1Widget extends StatelessWidget {
  const Tugas1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFBF8FC), // Background lembut sesuai contoh
        appBar: AppBar(
          title: const Text(
            'Tugas 1 - Layout Widget',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          backgroundColor: const Color(0xFF5B67F2), // Warna biru keunguan khas AppBar Tugas
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buatlah layout widget sebagai berikut:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

             Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8DEF8),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Color(0xFF65558F),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Kotak Bertumpuk',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Tumpukan Kotak (Stack)
              Center(
                child: SizedBox(
                  width: 220,
                  height: 220,
                  child: Stack(
                    children: [
                      // 1. Kotak Merah Paling Belakang
                      Container(
                        width: 220,
                        height: 220,
                        color: const Color(0xFFE53935),
                      ),
                      // 2. Kotak Biru di Kiri Atas
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 165,
                          height: 165,
                          color: const Color(0xFF2196F3),
                        ),
                      ),
                      // 3. Kotak Kuning di Kanan Bawah (Menimpa Biru & Merah)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 95,
                          height: 95,
                          color: const Color(0xFFFFEB3B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // -------------------------------------------------------------
              // 2. BANNER PROMOSI
              // -------------------------------------------------------------
              _buildSectionHeader('2', 'Banner Promosi'),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(width: 40),
                  SizedBox(
                    width: 280,
                    height: 180,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://picsum.photos/500/300',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: const Color(0xFF2D1E16)),
                        ),
                        Container(color: Colors.black.withValues(alpha: 0.34)),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'PROMO SPESIAL!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Diskon hingga 50% untuk produk pilihan.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.deepPurpleAccent,
                                  elevation: 2,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 8,
                                  ),
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  'Lihat Promo',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // -------------------------------------------------------------
              // 3. PROFIL SISWA DENGAN IKON EDIT
              // -------------------------------------------------------------
              _buildSectionHeader('3', 'Profil Siswa dengan Ikon Edit'),
              const SizedBox(height: 12),
              Center(
                child: Column(
                  children: [
                    // Avatar bertumpuk ikon edit
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 56,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Rainar Rizky Pangestu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Kelas XII SIJA 2',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_outline, size: 16),
                      label: const Text('Lihat Profil'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        side: const BorderSide(color: Colors.black26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // -------------------------------------------------------------
              // 4. BADGE KERANJANG BELANJA
              // -------------------------------------------------------------
              _buildSectionHeader('4', 'Badge Keranjang Belanja'),
              const SizedBox(height: 12),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.shopping_cart,
                              size: 48,
                              color: Colors.blue,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Keranjang Belanja',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Anda memiliki 5 produk di keranjang.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // -------------------------------------------------------------
              // 5. KARTU PRODUK MINIMARKET
              // -------------------------------------------------------------
              _buildSectionHeader('5', 'Kartu Produk Minimarket'),
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDC48), // Warna latar kuning khas minimarket
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bagian Atas Gambar + Badge Diskon & Favorite
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: SizedBox(
                          height: 160,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/Foto minyak1liter.jpg', // Gambar minyak/produk
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              // Badge Diskon
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    'DISKON 20%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              // Button Favorite
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Detail Produk & Tombol Tambah
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Minyak Goreng 1 Liter',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Rp 20.000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Harga sebelum diskon : Rp 25.000',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 16,
                                ),
                                label: const Text('Tambah ke Keranjang'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.indigo,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
        // Floating Action Button Kembali (Sesuai Desain E-Book)
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: const Color(0xFF6B72F6),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }

  // Helper Widget untuk Header Angka & Judul Bagian
  Widget _buildSectionHeader(String number, String title) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: const Color(0xFFEFE8FC),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}