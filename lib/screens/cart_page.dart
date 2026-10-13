import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void konfirmasiKosongkanKeranjang() {
    final CartController cartController = Get.find<CartController>();

    Get.dialog(
      AlertDialog(
        title: const Text('Kosongkan Keranjang?'),
        content: const Text(
          'Semua produk di keranjang akan dihapus. '
          'Yakin ingin melanjutkan?',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              cartController.clearCart();
              Get.back();

              Get.snackbar(
                'Berhasil',
                'Keranjang berhasil dikosongkan',
              );
            },
            child: const Text('Ya, kosongkan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController =
        Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text('Keranjang masih kosong'),
          );
        }

        return Column(
          children: [
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
                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga satuan: Rp '
                          '${product.price.toStringAsFixed(0)}',
                        ),
                        Text(
                          'Subtotal: Rp '
                          '${(product.price * quantity).toStringAsFixed(0)}',
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: quantity > 1
                                  ? () {
                                      cartController
                                          .decreaseQuantity(product);
                                    }
                                  : null,
                              icon: const Icon(Icons.remove),
                            ),
                            Text('$quantity'),
                            IconButton(
                              onPressed:
                                  quantity < product.stock
                                      ? () {
                                          cartController
                                              .increaseQuantity(product);
                                        }
                                      : null,
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Harga:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp ${cartController.totalHarga.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => const CheckoutPage());
                  },
                  child: const Text('Checkout'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: konfirmasiKosongkanKeranjang,
                  child: const Text('Kosongkan Keranjang'),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
