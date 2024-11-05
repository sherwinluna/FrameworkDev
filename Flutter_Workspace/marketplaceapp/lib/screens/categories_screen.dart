import 'package:flutter/material.dart';
import 'package:marketplaceapp/screens/category_products_screen.dart';

// lib/screens/categories_screen.dart
class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
      id: '1',
      name: 'Electronics',
      icon: Icons.devices,
      color: Colors.blue,
    ),
    Category(
      id: '2',
      name: 'Fashion',
      icon: Icons.shopping_bag,
      color: Colors.pink,
    ),
    Category(
      id: '3',
      name: 'Home & Garden',
      icon: Icons.home,
      color: Colors.green,
    ),
    // Add more categories
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class Category {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryProductsScreen(category: category),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 40,
              color: category.color,
            ),
            SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}