import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/orders_item.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = '/orderscreen';
  @override
  Widget build(BuildContext context) {
    final orderItem = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orderItem.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderItem.orders[i]),
      ),
    );
  }
}
