import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../widget/product_grid.dart';

enum FilterOptions{
  Favourite,
  All
}

class ProductsOverviewScreen extends StatelessWidget{
 
  @override
  Widget build(BuildContext context){
    final productContainer = Provider.of<Products>(context, listen:  false);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
             if(selectedValue == FilterOptions.Favourite){
               productContainer.showFavouriteOnly();
             }
             else{
              productContainer.showAll();
             }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) =>[
              PopupMenuItem(child: Text('Only Favourites'), value: FilterOptions.Favourite,),
               PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,)
            ])
        ],
        ),
      body: ProductGrid(),
    );
  }
}