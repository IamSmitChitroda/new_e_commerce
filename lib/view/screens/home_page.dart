import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_e_commerce/utills/products_utills.dart';

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
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.replaceFirst(e[0], e[0].toUpperCase()),
                            style: TextStyle(
                              fontSize: h * 0.02,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...allProducts
                                    .map((element) => (element['category'] == e)
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                MyRoutes.detailPage,
                                                arguments: element,
                                              );
                                            },
                                            child: Container(
                                              height: h * 0.3,
                                              width: w * 0.5,
                                              margin: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 5,
                                                    offset: Offset(3, 3),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: h * 0.2,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              element[
                                                                  'thumbnail']),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: h * 0.1,
                                                    width: w * 0.5,
                                                    color: Colors.grey.shade100,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          element['title'],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          element[
                                                              'description'],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                            "\$ ${element['price']}"),
                                                        // RatingBar.builder(itemBuilder: Icon(Icons.start), onRatingUpdate: onRatingUpdate)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container())
                                    .toList()
                              ],
                            ),
                          ),
                        ],
                      ),
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
