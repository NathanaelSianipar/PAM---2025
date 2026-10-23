import 'package:flutter/material.dart';
import '../data/categories.dart';
import '../data/products.dart';
import '../models/category.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/category_item.dart';
import '../widgets/safe_image.dart';
import 'protein_page.dart';

class HomePage extends StatelessWidget {
  final String namaToko;
  const HomePage({super.key, required this.namaToko});

  void _onCategoryTap(BuildContext context, Category c) {
    if (c.active) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProteinPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kategori ${c.label.replaceAll('\n', ' ')} belum aktif')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Home'),
        actions: const [Icon(Icons.search), SizedBox(width: 12)],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(namaToko,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          // Komponen wajib: daftar ikon kategori
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              spacing: 6,
              runSpacing: 8,
              children: categories
                  .map((c) => CategoryItem(cat: c, onTap: () => _onCategoryTap(context, c)))
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
          // ---------- Komponen bonus ----------
          Container(
            height: 70,
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dikirim Besok', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('ke Pilih Lokasi ⌄', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text('Lihat Lebih Banyak ⌄',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                for (final p in proteinProducts.take(2))
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SafeImage(p.image)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
