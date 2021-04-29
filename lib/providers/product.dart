import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.description,
      this.isFavorite = false,
      @required this.price,
      @required this.title,
      @required this.imageUrl});

  void isFavirotetoggle() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
