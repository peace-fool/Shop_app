import 'package:flutter/material.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../widget/product_grid.dart';

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
               PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,)
            ])
        ],
        ),
      body: ProductGrid(_showOnlyFavourite),
    );
  }
}