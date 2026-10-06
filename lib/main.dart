import 'package:flutter/material.dart';
import 'screens/product_detail_page.dart';
import 'models/product.dart';
import 'screens/main_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoKita',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),

      home: const MainPage(),

      routes: {
        '/detail': (context) => ProductDetailPage(
              product: ModalRoute.of(context)!.settings.arguments
                  as Product,
            ),
      },
    );
  }
}