import 'package:flutter/material.dart';
import '../data/categories.dart';
import '../data/products.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/cart_bar.dart';
import '../widgets/category_item.dart';
import '../widgets/protein_item.dart';
import 'detail_page.dart';

class ProteinPage extends StatefulWidget {
  const ProteinPage({super.key});

  @override
  State<ProteinPage> createState() => _ProteinPageState();
}

class _ProteinPageState extends State<ProteinPage> {
  final Map<int, int> _cart = {}; // index produk -> jumlah

  int get _totalItems => _cart.values.fold(0, (a, b) => a + b);
  int get _totalPrice =>
      _cart.entries.fold(0, (a, e) => a + proteinProducts[e.key].price * e.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari lebih banyak di Terjadwal...',
            prefixIcon: const Icon(Icons.search, size: 18),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          ),
        ),
      ),
      body: Column(
        children: [
          // Baris kategori, Protein terpilih
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                for (final c in categories)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CategoryItem(
                      cat: c,
                      selected: c.label == 'Protein',
                      onTap: () {},
                    ),
                  ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Aneka Protein Segar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                childAspectRatio: 0.62,
              ),
              itemCount: proteinProducts.length,
              itemBuilder: (context, i) {
                final p = proteinProducts[i];
                return ProteinItem(
                  product: p,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetailPage(product: p)),
                  ),
                  onAdd: () => setState(() => _cart[i] = (_cart[i] ?? 0) + 1),
                );
              },
            ),
          ),
          // Komponen bonus
          CartBar(totalItems: _totalItems, totalPrice: _totalPrice),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
