import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget{
  final String id;
  final String title;
  final String imageUrl;
  ProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl
  });
  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
          child: GridTile(
        child: GestureDetector(
          onTap:(){ Navigator.of(context).pushNamed('/product_detail_screen', arguments: id);},
          child: Card(child: Image.network(imageUrl, fit: BoxFit.cover,), elevation: 5,)),
        footer: GridTileBar(
          title: Text(title, textAlign: TextAlign.center,), 
          backgroundColor: Colors.black87,
          leading: IconButton(icon: Icon(Icons.favorite , color: Theme.of(context).accentColor), onPressed: null),
          trailing: IconButton(icon: Icon(Icons.shopping_cart, color: Theme.of(context).primaryColor), onPressed: null),
          ),
        ),
    );
  }
}