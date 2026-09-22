import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final String kategori;

  const CategoryTag({super.key, required this.kategori});

  Color _warnaKategori() {
    switch (kategori) {
      case 'Elektronik':
        return Colors.blue;
      case 'Fashion':
        return Colors.purple;
      case 'Makanan':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(color: _warnaKategori()),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        kategori,
        style: TextStyle(
          color: _warnaKategori(),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


