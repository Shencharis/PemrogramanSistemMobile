import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final String status; // 'Tersedia', 'Stok Terbatas', 'Habis'

  const StockBadge({super.key, required this.status});

  Color _warnaLatar() {
    switch (status) {
      case 'Habis':
        return Colors.red[100]!;
      case 'Stok Terbatas':
        return Colors.orange[100]!;
      default:
        return Colors.green[100]!;
    }
  }

  Color _warnaTeks() {
    switch (status) {
      case 'Habis':
        return Colors.red[800]!;
      case 'Stok Terbatas':
        return Colors.orange[800]!;
      default:
        return Colors.green[800]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _warnaLatar(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: _warnaTeks(),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
