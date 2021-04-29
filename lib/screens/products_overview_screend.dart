import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions { Favirote, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showOnlyFavirote = false;
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('overview'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favirote) {
                    showOnlyFavirote = true;
                  } else {
                    showOnlyFavirote = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Favirote'),
                      value: FilterOptions.Favirote,
                    ),
                    PopupMenuItem(
                      child: Text('All'),
                      value: FilterOptions.All,
                    )
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: carts.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(showOnlyFavirote),
    );
  }
}
