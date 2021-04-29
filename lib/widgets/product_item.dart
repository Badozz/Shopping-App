import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart.dart';
import '../screens/products_details_screen.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductsDetailsScreen.routeName,
              arguments: product.id);
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
        leading: IconButton(
          icon: Icon(product.isFavorite
              ? Icons.favorite
              : Icons.favorite_border_outlined),
          onPressed: () {
            product.isFavirotetoggle();
          },
          color: Theme.of(context).accentColor,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Theme.of(context).accentColor,
          onPressed: () {
            cart.addItme(product.id, product.title, product.price);
          },
        ),
      ),
    );
  }
}
