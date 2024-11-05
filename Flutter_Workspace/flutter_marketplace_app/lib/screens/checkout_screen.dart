import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    void _confirmOrder() {
      // Clear the cart after checkout
      cart.items.clear();
      cart.notifyListeners();

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Order Confirmed!'),
          content: Text('Your order has been placed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to HomeScreen
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: cart.items.values.map((item) {
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Text('\$${item.price * item.quantity}'),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Total'),
              trailing: Text(
                '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _confirmOrder,
                child: Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
