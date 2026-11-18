import 'package:flutter/material.dart';

class Tugas2Widget extends StatelessWidget {
  const Tugas2Widget({super.key});

  static const navy = Color(0xFF202B38);
  static const blue = Color(0xFF0876B9);
  static const lightBlue = Color(0xFFE2F3FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(14, 18, 14, 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 9),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TUGAS 2 - SijaMart',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: navy,
                              ),
                            ),
                            Text(
                              'Belanja mudah dan hemat',
                              style: TextStyle(fontSize: 8, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.notifications_none, color: navy),
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(left: 1, bottom: 17),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Selamat pagi,',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rainar 👋',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: navy,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Mau belanja apa hari ini?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xFFDCEEFF),
                        child: Icon(Icons.person, color: blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, size: 24, color: Colors.grey),
                              SizedBox(width: 9),
                              Text(
                                'Cari produk yang kamu inginkan...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 142,
                    padding: const EdgeInsets.fromLTRB(16, 22, 12, 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF147DBB), Color(0xFF40A9E8)],
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Stack(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PROMO SPESIAL',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Diskon Hingga\n50%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                height: .98,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Belanja sekarang dan hemat!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 2,
                          bottom: 4,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 57,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'HOT DEAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _sectionTitle('Kategori Produk'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _Category(
                        Icons.restaurant,
                        'Makanan',
                        Color(0xFFFFEEDC),
                        Colors.orange,
                      ),
                      _Category(
                        Icons.local_cafe,
                        'Minuman',
                        Color(0xFFEDE7E5),
                        Color(0xFF76554D),
                      ),
                      _Category(
                        Icons.devices,
                        'Elektronik',
                        Color(0xFFDCEFFF),
                        Color(0xFF279CE0),
                      ),
                      _Category(
                        Icons.checkroom,
                        'Fashion',
                        Color(0xFFF0DDF5),
                        Color(0xFF9B3BB2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  _sectionTitle('Produk Populer'),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: .88,
                    children: const [
                      _Product(
                        'Indomie Goreng',
                        'Rp3.500',
                        '-12%',
                        Icons.ramen_dining,
                        Color(0xFFFFF0DC),
                        Colors.orange,
                      ),
                      _Product(
                        'Susu Fresh Milk',
                        'Rp8.000',
                        '-20%',
                        Icons.local_drink,
                        Color(0xFFE1F2FF),
                        Color(0xFF209CE1),
                      ),
                      _Product(
                        'Roti Cokelat',
                        'Rp6.000',
                        '-14%',
                        Icons.bakery_dining,
                        Color(0xFFF0E9E7),
                        Color(0xFF80665A),
                      ),
                      _Product(
                        'Keripik Kentang',
                        'Rp9.000',
                        '-25%',
                        Icons.fastfood,
                        Color(0xFFFFE8E2),
                        Color(0xFFFF542C),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 18,
              bottom: 18,
              child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                backgroundColor: const Color(0xFF5267F5),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Row(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
      ),
      const Spacer(),
      const Text(
        'Lihat semua',
        style: TextStyle(fontSize: 11, color: Color(0xFF35617A)),
      ),
    ],
  );
}

class _Category extends StatelessWidget {
  const _Category(this.icon, this.label, this.bg, this.color);
  final IconData icon;
  final String label;
  final Color bg, color;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      const SizedBox(height: 5),
      Text(label, style: const TextStyle(fontSize: 10, color: Colors.black87)),
    ],
  );
}

class _Product extends StatelessWidget {
  const _Product(
    this.name,
    this.price,
    this.discount,
    this.icon,
    this.bg,
    this.color,
  );
  final String name, price, discount;
  final IconData icon;
  final Color bg, color;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [BoxShadow(color: Color(0x18000000), blurRadius: 3)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: bg,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Center(child: Icon(icon, color: color, size: 39)),
            ),
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  discount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
                size: 24,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 8, 7, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Tugas2Widget.navy,
                ),
              ),
              const Text(
                'Rp10.000',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF28749B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(0, 8),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Tugas2Widget.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
