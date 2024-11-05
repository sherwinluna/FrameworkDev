import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView(
        children: cart.items.values.map((item) {
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('\$${item.price * item.quantity}'),
          );
        }).toList(),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CheckoutScreen()),
          );
        },
        child: Text('Checkout (\$${cart.totalAmount})'),
      ),
    );
  }
}
