import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart.dart';
import 'screen/product_detail_screen.dart';
import 'screen/product_overview_screen.dart';
import 'providers/product_provider.dart';
import 'screen/cart_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(providers: [
       ChangeNotifierProvider(
      create: (ctx) => Products(),
      ),
      ChangeNotifierProvider(
      create: (ctx) => Cart(),
      )
    ],
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
          '/cart_screen' : (ctx) => CartScreen(),
        },
      ),
    );
  }
}

