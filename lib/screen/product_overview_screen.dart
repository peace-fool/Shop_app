import 'package:flutter/material.dart';
import '../widget/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget{
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('My Shop'),),
      body: ProductGrid(),
    );
  }
}