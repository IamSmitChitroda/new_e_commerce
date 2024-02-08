import 'package:flutter/material.dart';
import 'package:new_e_commerce/view/category/category_product.dart';

Widget CategoryView({
  required BuildContext context,
  required String category,
}) {
  Size size = MediaQuery.sizeOf(context);
  double h = size.height;
  double w = size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        category.replaceFirst(category[0], category[0].toUpperCase()),
        style: TextStyle(
          fontSize: h * 0.02,
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CategoryProduct(context: context, category: category),
      ),
    ],
  );
}
