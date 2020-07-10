import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final productData = Provider.of<Products>(context);
    final products =productData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2 , crossAxisSpacing: 10, mainAxisSpacing: 10), 
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value( 
        value: products[i],
        child:ProductItem()),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      );
  }
}