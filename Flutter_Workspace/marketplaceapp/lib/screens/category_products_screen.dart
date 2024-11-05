import 'package:flutter/material.dart';
import 'package:marketplaceapp/screens/categories_screen.dart';

import '../widgets/product_card.dart';
import '../models/product.dart';

// lib/screens/category_products_screen.dart
class CategoryProductsScreen extends StatelessWidget {
  final Category category;

  CategoryProductsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ProductGrid(
        category: category.id,
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final String category;

  ProductGrid({required this.category});

  @override
  Widget build(BuildContext context) {
    // In a real app, filter products by category
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10, // Replace with actual filtered products count
      itemBuilder: (context, index) {
        return ProductCard(
          product: Product(
            id: 'product_$index',
            name: 'Product ${index + 1}',
            description: 'Description for Product ${index + 1}',
            price: 99.99,
            imageUrl: 'https://via.placeholder.com/150',
            rating: 4.5,
            reviews: [],
          ),
        );
      },
    );
  }
}