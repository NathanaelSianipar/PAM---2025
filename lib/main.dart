import 'package:flutter/material.dart';
import 'screens/registration_page.dart';

void main() => runApp(const TokoTegarApp());

class TokoTegarApp extends StatelessWidget {
  const TokoTegarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Tegar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
    );
  }
}
