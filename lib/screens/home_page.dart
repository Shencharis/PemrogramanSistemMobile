import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header menggunakan Row dan Column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'TokoKita',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Belanja jadi lebih mudah',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: daftarProduk.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: daftarProduk[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}