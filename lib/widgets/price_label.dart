import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  final double harga;

  const PriceLabel({super.key, required this.harga});

  String _formatRupiah(double angka) {
    String s = angka.toStringAsFixed(0);
    String hasil = '';
    int hitung = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      hasil = s[i] + hasil;
      hitung++;
      if (hitung % 3 == 0 && i != 0) hasil = '.$hasil';
    }
    return 'Rp $hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatRupiah(harga),
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}