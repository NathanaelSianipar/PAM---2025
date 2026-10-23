import 'package:flutter/material.dart';
import 'home_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaToko = TextEditingController();
  final _namaPemilik = TextEditingController();
  final _alamat = TextEditingController();
  final _kontak = TextEditingController();
  final _jenisUsaha = ['Makanan & Minuman', 'Sayur Mayur', 'Sembako', 'Lainnya'];
  String _selectedJenis = 'Makanan & Minuman';
  bool _agree = false;

  @override
  void dispose() {
    _namaToko.dispose();
    _namaPemilik.dispose();
    _alamat.dispose();
    _kontak.dispose();
    super.dispose();
  }

  String? _required(String? v, String label) =>
      (v == null || v.trim().isEmpty) ? '$label wajib diisi' : null;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Anda harus menyetujui syarat dan ketentuan')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomePage(namaToko: _namaToko.text.trim())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrasi Pemilik Toko')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaToko,
                decoration: const InputDecoration(labelText: 'Nama Toko'),
                validator: (v) => _required(v, 'Nama Toko'),
              ),
              TextFormField(
                controller: _namaPemilik,
                decoration: const InputDecoration(labelText: 'Nama Pemilik'),
                validator: (v) => _required(v, 'Nama Pemilik'),
              ),
              DropdownButtonFormField<String>(
                value: _selectedJenis,
                decoration: const InputDecoration(labelText: 'Jenis Usaha'),
                items: _jenisUsaha
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedJenis = v!),
              ),
              TextFormField(
                controller: _alamat,
                decoration: const InputDecoration(labelText: 'Alamat Toko'),
                validator: (v) => _required(v, 'Alamat Toko'),
              ),
              TextFormField(
                controller: _kontak,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Kontak'),
                validator: (v) => _required(v, 'Kontak'),
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                value: _agree,
                onChanged: (v) => setState(() => _agree = v ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Saya menyetujui syarat dan ketentuan',
                    style: TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: _agree ? _submit : null, // aktif hanya jika dicentang
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
