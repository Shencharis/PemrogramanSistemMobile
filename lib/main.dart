import 'package:flutter/material.dart';

import 'widgets/product_card.dart';
import 'models/product.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoKita',
      home: Scaffold(
        appBar: AppBar(title: const Text('TokoKita')),
        body: ListView.builder(
          itemCount: daftarProduk.length,
          itemBuilder: (context, index) =>
              ProductCard(product: daftarProduk[index]),
        ),
      ),
    );
  }
}
