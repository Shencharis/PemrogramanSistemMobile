
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../widgets/price_label.dart';
import '../widgets/stock_bagde.dart';
import '../widgets/category_tag.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.shopping_bag,
                size: 90,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            CategoryTag(kategori: product.category),
            const SizedBox(height: 10),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            PriceLabel(harga: product.price),
            const SizedBox(height: 10),

            StockBadge(status: product.getStatusStok()),
            const SizedBox(height: 24),

            const Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              product.deskripsiAman,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Jumlah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                IconButton(
                  onPressed: jumlah > 1
                      ? () {
                          setState(() {
                            jumlah--;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '$jumlah',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: jumlah < product.stock
                      ? () {
                          setState(() {
                            jumlah++;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  for (int i = 0; i < jumlah; i++) {
                    cartController.addToCart(product);
                  }

                  Get.back();

                  Get.snackbar(
                    'Berhasil',
                    '$jumlah ${product.name} ditambahkan ke keranjang',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
