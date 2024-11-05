import 'package:flutter/material.dart';

// lib/screens/profile_screen.dart
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'john.doe@example.com',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('My Orders'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to orders screen
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Wishlist'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to wishlist screen
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Shipping Addresses'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to addresses screen
              },
            ),
            ListTile(
              leading: Icon(Icons.payment_outlined),
              title: Text('Payment Methods'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to payment methods screen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Settings'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // Implement logout logic
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}