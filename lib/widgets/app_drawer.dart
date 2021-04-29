import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('MEOW'),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).accentColor,
            ),
            trailing: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Theme.of(context).accentColor,
            ),
            trailing: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
