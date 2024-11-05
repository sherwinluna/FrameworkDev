// lib/models/cart.dart
import 'package:marketplaceapp/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}