import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_e_commerce/utills/products_utills.dart';
import 'package:new_e_commerce/view/category/category_view.dart';

import '../../utills/routes_utills.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    log("$Categorios}");

    print("Hello World");
    log("Hello World");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TECHTOPIA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SearchBar(
              leading: Icon(Icons.search),
              hintText: "Search here",
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/10/03/19/08/sale-1712540_960_720.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...Categorios.map(
                      //AllCategories
                      (e) => CategoryView(context: context, category: e),
                    ).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
