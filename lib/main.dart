import 'package:flutter/material.dart';
import 'package:new_e_commerce/utills/routes_utills.dart';
import 'package:new_e_commerce/view/screens/detail_page.dart';
import 'package:new_e_commerce/view/screens/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        // MyRoutes.cartPage: (context) => const
      },
    );
  }
}
