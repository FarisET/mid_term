import 'package:flutter/material.dart';
import 'package:mid_term/widgets/products.dart';
import 'package:provider/provider.dart';

import 'model/data_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)  => ProviderClass(),
      child: MaterialApp(
          title: 'Mid term',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductPage()),
    );
  }
}
