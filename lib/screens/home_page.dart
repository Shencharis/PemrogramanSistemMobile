
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita'),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Obx(
                  () => Badge(
                    label: Text(
                      cartController.totalItem.toString(),
                    ),
                    isLabelVisible: cartController.totalItem > 0,
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                  ),
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
                  onTap: () {
                    Get.toNamed(
                      '/detail',
                      arguments: daftarProduk[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
