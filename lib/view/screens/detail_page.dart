import 'package:flutter/material.dart';

import '../../utills/products_utills.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> data = (ModalRoute.of(context)?.settings.arguments ??
        allProducts[0]) as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Column(
        children: [
          //ThumbNailView
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                data['images'].length,
                (index) => Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(data['images'][index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.all(
                    10,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          //DetailsCard
          Container(
            height: size.height * 0.55,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                  color: Colors.grey,
                ),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
