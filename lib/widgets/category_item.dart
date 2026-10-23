import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category cat;
  final bool selected;
  final VoidCallback onTap;
  const CategoryItem({
    super.key,
    required this.cat,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 62,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: selected ? Border.all(color: Colors.green, width: 2) : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Icon(cat.icon, color: cat.color, size: 30),
            const SizedBox(height: 4),
            Text(cat.label,
                textAlign: TextAlign.center, style: const TextStyle(fontSize: 9)),
          ],
        ),
      ),
    );
  }
}
