import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/format.dart';
import 'safe_image.dart';

class ProteinItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onAdd;
  const ProteinItem({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SafeImage(product.image)),
                Positioned(
                  right: 4,
                  top: 4,
                  child: GestureDetector(
                    onTap: onAdd,
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(rupiah(product.price),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          Text(product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10)),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Sisa ${product.stock}',
                style: const TextStyle(color: Colors.red, fontSize: 9)),
          ),
        ],
      ),
    );
  }
}
