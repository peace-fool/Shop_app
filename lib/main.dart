import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/product_detail_screen.dart';
import 'screen/product_overview_screen.dart';
import 'providers/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
          child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          '/product_detail_screen' : (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

