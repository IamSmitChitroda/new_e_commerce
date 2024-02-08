import 'package:flutter/material.dart';

import '../../utills/products_utills.dart';
import '../../utills/routes_utills.dart';

Widget CategoryProduct(
    {required BuildContext context, required String category}) {
  Size size = MediaQuery.sizeOf(context);
  double h = size.height;
  double w = size.width;
  return Row(
    children: [
      ...allProducts
          .map((element) => (element['category'] == category)
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
                                image: NetworkImage(element['thumbnail']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: h * 0.1,
                          width: w * 0.5,
                          color: Colors.grey.shade100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element['title'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                element['description'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("\$ ${element['price']}"),
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
  );
}
