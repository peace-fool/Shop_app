import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/product_grid.dart';
import '../widget/badge.dart';
import '../providers/cart.dart';

enum FilterOptions{
  Favourite,
  All
}

class ProductsOverviewScreen extends StatefulWidget{
 
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourite = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected:
           
             (FilterOptions selectedValue){ setState(() {
              if(selectedValue == FilterOptions.Favourite){
               _showOnlyFavourite = true;
             }
             else{
                _showOnlyFavourite = false;
             }
            }); 
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) =>[
              PopupMenuItem(child: Text('Only Favourites'), value: FilterOptions.Favourite,),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,), 
            ]),
            Consumer<Cart>(builder: (_, cartData, ch) =>  Badge(
              child: ch, 
              value: cartData.itemCount.toString()),
              child:
              IconButton(icon: Icon(Icons.shopping_cart), 
              onPressed: null)
              )
         
        ],
        ),
      body: ProductGrid(_showOnlyFavourite),
    );
  }
}