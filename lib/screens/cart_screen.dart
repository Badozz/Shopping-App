import 'package:flutter/material.dart';
import '../providers/orders.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../widgets/app_drawer.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cartScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR CART'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TOTAL'),
                  Spacer(),
                  Chip(
                    label: Text(
                      cart.totalAmount.toStringAsFixed(2),
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              .color),
                    ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrders(
                        cart.item.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clearData();
                    },
                    child: Text(
                      'ORDERNOW',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartItem(
                cart.item.values.toList()[i].id,
                cart.item.keys.toList()[i],
                cart.item.values.toList()[i].price,
                cart.item.values.toList()[i].title,
                cart.item.values.toList()[i].quantity,
              ),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
