import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk'), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
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

            // Kategori
            CategoryTag(kategori: product.category),

            const SizedBox(height: 10),

            // Nama produk
            Text(
              product.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Harga
            PriceLabel(harga: product.price),

            const SizedBox(height: 10),

            // Stok
            StockBadge(status: product.getStatusStok()),

            const SizedBox(height: 24),

            // Deskripsi
            const Text(
              'Deskripsi Produk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

            // Jumlah
            const Text(
              'Jumlah',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                // Tombol kurang
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

                // Jumlah
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

                // Tombol tambah
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
                  Navigator.pop(context, jumlah);
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
