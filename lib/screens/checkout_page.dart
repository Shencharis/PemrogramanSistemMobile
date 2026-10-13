
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'main_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController =
        Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Pesanan'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text('Tidak ada pesanan untuk ditampilkan'),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detail Pesanan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final product =
                        cartController.cartItems[index];

                    final quantity =
                        cartController.quantities[product.id] ?? 1;

                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(
                        '$quantity barang x Rp '
                        '${product.price.toStringAsFixed(0)}',
                      ),
                      trailing: Text(
                        'Rp ${(product.price * quantity).toStringAsFixed(0)}',
                      ),
                    );
                  },
                ),
              ),

              const Divider(),

              Text(
                'Total Barang: ${cartController.totalItem}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 8),

              Text(
                'Total Harga: Rp '
                '${cartController.totalHarga.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const MainPage());
                  },
                  child: const Text('Kembali ke Beranda'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
