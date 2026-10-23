import 'package:flutter/material.dart';
import '../utils/format.dart';

class CartBar extends StatelessWidget {
  final int totalItems;
  final int totalPrice;
  const CartBar({super.key, required this.totalItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.green.shade700, borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Lihat Keranjang',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text('$totalItems Barang',
                  style: const TextStyle(color: Colors.white, fontSize: 11)),
            ],
          ),
          Text(rupiah(totalPrice),
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
