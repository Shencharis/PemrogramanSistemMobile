import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/cart_controller.dart';
import 'screens/product_detail_page.dart';
import 'models/product.dart';
import 'screens/main_page.dart';


void main() {
  Get.put(CartController());
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TokoKita',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      home: const MainPage(),

      getPages: [
        GetPage(
          name: '/detail',
          page: () => ProductDetailPage(product: Get.arguments as Product),
        ),
      ],
    );
  }
}
