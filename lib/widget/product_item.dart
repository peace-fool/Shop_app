import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';


class ProductItem extends StatelessWidget{
 // final String id;
  //final String title;
  //final String imageUrl;
  //ProductItem({
   // @required this.id,
    //@required this.title,
    //@required this.imageUrl
  //});
  @override
  Widget build(BuildContext context){
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
          child: GridTile(
        child: GestureDetector(
          onTap:(){ Navigator.of(context).pushNamed('/product_detail_screen', arguments: product.id);},
          child: Card(child: Image.network(product.imageUrl, fit: BoxFit.cover,), elevation: 5,)),
        footer: GridTileBar(
          title: Text(product.title, textAlign: TextAlign.center,), 
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product , child) =>
             IconButton(icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border , color: Theme.of(context).accentColor), onPressed: (){
              product.toggleFavouriteStatus();
            }),
          ),
          trailing: IconButton(icon: Icon(Icons.shopping_cart, color: Theme.of(context).primaryColor), onPressed: (){
            cart.addItem(product.id, product.price, product.title);
          }),
          ),
        ),
    );
  }
}