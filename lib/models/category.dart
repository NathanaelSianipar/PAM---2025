import 'package:flutter/material.dart';

class Category {
  final String label;
  final IconData icon;
  final Color color;
  final bool active;
  const Category(this.label, this.icon, this.color, {this.active = false});
}
