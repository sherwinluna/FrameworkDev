import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addToCart(String productId, String name, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existing) => CartItem(
          productId: existing.productId,
          name: existing.name,
          price: existing.price,
          quantity: existing.quantity + 1,
        ),
      );
    } else {
      _items[productId] = CartItem(
        productId: productId,
        name: name,
        price: price,
        quantity: 1,
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalAmount {
    return _items.values
        .fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }
}
