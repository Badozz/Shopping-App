import 'package:flutter/material.dart';
import 'package:shopping_app/providers/cart.dart';

class OrderData {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartData> products;
  OrderData({this.amount, this.dateTime, this.id, this.products});
}

class Orders with ChangeNotifier {
  List<OrderData> _orders = [];
  List<OrderData> get orders {
    return [..._orders];
  }

  void addOrders(List<CartData> cartProducts, double amount) {
    _orders.insert(
      0,
      OrderData(
        amount: amount,
        id: DateTime.now().toString(),
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
