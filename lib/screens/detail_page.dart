import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../models/product.dart';
import '../utils/format.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/safe_image.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  Future<void> _orderViaWhatsApp(BuildContext context) async {
    final text = Uri.encodeComponent(
        'Halo, saya ingin memesan ${product.name} (${rupiah(product.price)})');
    final uri = Uri.parse('https://wa.me/$waNumber?text=$text');
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak dapat membuka WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan'),
        centerTitle: true,
        actions: const [Icon(Icons.notifications_none), SizedBox(width: 12)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(product.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            AspectRatio(aspectRatio: 1.6, child: SafeImage(product.image)),
            const SizedBox(height: 12),
            Text(rupiah(product.price),
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            // Komponen bonus
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () => _orderViaWhatsApp(context),
              icon: const Icon(Icons.chat),
              label: const Text('Order via WhatsApp\nKlik di Sini!',
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
