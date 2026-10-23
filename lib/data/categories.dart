import 'package:flutter/material.dart';
import '../models/category.dart';

const List<Category> categories = [
  Category('Produk\nTerbaru', Icons.new_releases, Colors.amber),
  Category('Beli Lagi', Icons.shopping_cart, Colors.red),
  Category('Clearance\nSale', Icons.alarm, Colors.black87),
  Category('Sayur', Icons.eco, Colors.green),
  Category('Buah', Icons.apple, Colors.orange),
  Category('Protein', Icons.set_meal, Colors.redAccent, active: true),
];
