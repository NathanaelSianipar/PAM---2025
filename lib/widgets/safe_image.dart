import 'package:flutter/material.dart';

/// Image.asset dengan placeholder jika file gambar belum ada.
class SafeImage extends StatelessWidget {
  final String path;
  const SafeImage(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (_, __, ___) => Container(
        color: Colors.grey.shade300,
        child: const Center(child: Icon(Icons.image, color: Colors.grey)),
      ),
    );
  }
}
