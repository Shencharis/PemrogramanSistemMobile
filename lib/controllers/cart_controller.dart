import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  final RxList<Product> cartItems = <Product>[].obs;

  final RxMap<String, int> quantities = <String, int>{}.obs;

  int get totalItem {
    return quantities.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double get totalHarga {
    double total = 0;

    for (Product product in cartItems) {
      total += product.price * (quantities[product.id] ?? 1);
    }

    return total;
  }

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      quantities[product.id] = (quantities[product.id] ?? 1) + 1;
    } else {
      cartItems.add(product);
      quantities[product.id] = 1;
    }

    quantities.refresh();
  }

  void increaseQuantity(Product product) {
    final currentQuantity = quantities[product.id] ?? 1;

    if (currentQuantity < product.stock) {
      quantities[product.id] = currentQuantity + 1;
      quantities.refresh();
    }
  }

  void decreaseQuantity(Product product) {
    final currentQuantity = quantities[product.id] ?? 1;

    if (currentQuantity > 1) {
      quantities[product.id] = currentQuantity - 1;
      quantities.refresh();
    }
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.id == product.id);
    quantities.remove(product.id);
  }

  void clearCart() {
    cartItems.clear();
    quantities.clear();
  }
}
