// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mid_term/model/data_class.dart';
import 'package:mid_term/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

// Import statements...

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<Products>> futureProducts;

  @override
  void initState() {
   super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {  
        Provider.of<ProviderClass>(context, listen: false).getPostData();
      // productViewModel.getToken();
    });
   


  //  futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final postModel =  Provider.of<ProviderClass>(context); 

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Products')),
      ),
      body: SafeArea(
        child: _buildList(postModel.post ?? [] )
      ),
    );
  }

  ListView _buildList(List<Products> snapshot) {
    return ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, i) {
                var item = snapshot[i];
                return Text(item.title);
                // return GestureDetector(
                //   onTap: () {
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return ListView(
                //           children: [
                //             SizedBox(
                //               height: 100.0,
                //               child: ListView(
                //                 scrollDirection: Axis.horizontal,
                //                 children: <Widget>[
                //                   // CachedNetworkImage(
                //                   //   imageUrl: item?.thumbnailUrl ?? "",
                //                   //   placeholder: (context, url) =>
                //                   //       CircularProgressIndicator(),
                //                   //   errorWidget: (context, url, error) =>
                //                   //       Icon(Icons.error),
                //                   // ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         );
                //       },
                //     );
                //   },
                //   child: Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Column(children: [
                //         // CachedNetworkImage(
                //         //   imageUrl: item?.thumbnailUrl ?? "",
                //         //   placeholder: (context, url) =>
                //         //       CircularProgressIndicator(),
                //         //   errorWidget: (context, url, error) =>
                //         //       Icon(Icons.error),
                //         // ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(item.title ),
                //             Text("${item.price} USD"),
                //           ],
                //         ),
                //         Text(
                //             Text("${item.description}") as String
                //         ),
                //       ]),
                //     ),
                //   ),
                // );
                }

              
            );
  }
}
