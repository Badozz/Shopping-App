import 'package:flutter/material.dart';

class CartData {
  String id;
  String title;
  double price;
  int quantity;

  CartData({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartData> _item = {};

  Map<String, CartData> get item => {..._item};

  int get itemCount => _item.length;

  double get totalAmount {
    var total = 0.0;
    _item.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItme(String productId, String title, double price) {
    if (_item.containsKey(productId)) {
      _item.update(
          productId,
          (existingCartItme) => CartData(
                id: existingCartItme.id,
                title: existingCartItme.title,
                price: existingCartItme.price,
                quantity: existingCartItme.quantity + 1,
              ));
    } else {
      _item.putIfAbsent(
        productId,
        () => CartData(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  void deleteItem(productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void clearData() {
    _item = {};
    notifyListeners();
  }
}
