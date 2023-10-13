// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mid_term/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<Products>> futureProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Products')),
      ),
      body: SafeArea(
        // child: FutureBuilder<List<Products>>(
        //     future: futureProducts,
        //     builder: (BuildContext, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //             itemCount: snapshot.data!.length,
        //             itemBuilder: (context, i) {
        //               var item = snapshot.data?[i];
        //               Text('12345');
        //             });

        //         // return Card(
        //         //   child: Column(children: [Text('${item.}'), Text('Hello')]),
        //         // );
        //       } else if (snapshot.hasError) {
        //         return Text('${snapshot.error}');
        //       } else {
        //         return CircularProgressIndicator();
        //       }
        //     }),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ListView(
                            children: [
                              new SizedBox(
                                height: 100.0,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        CachedNetworkImage(
                          imageUrl:
                              "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Iphone 9'), Text('49 USD')],
                        ),
                        Text(
                            'Русский Generate Lorem Ipsum placeholder text for use in your graphic, print and web layouts, and discover plugins for your favorite writing, design and blogging tools. Explore th')
                      ]),
                    ),
                  ));
            }),
      ),
    );
  }
}

Future<List<Products>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final json = ("[" + response.body + "]");
    List<dynamic> parseListJson = jsonDecode(json);
    // List parseListJson = jsonDecode(json);
    List<Products> productItem =
        parseListJson.map((jsonMap) => Products.fromJson(jsonMap)).toList();
    // List<Products>.from(
    //     parseListJson.map<List<Products>>((dynamic i) => Products.fromJson(i)));
    return productItem;
  } else {
    throw Exception("Failed to load products");
  }
}
