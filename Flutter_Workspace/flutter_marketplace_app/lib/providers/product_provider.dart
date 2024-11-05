/*import '../models/product_model.dart';

class ProductProvider {
  List<Product> _products = [
    Product(
      id: '1',
      name: 'Laptop',
      description: 'High performance laptop',
      price: 999.99,
      imageUrl: 'https://via.placeholder.com/150',
      rating: 4.5,
      reviews: [],
    ),
    Product(
      id: '2',
      name: 'Smartphone',
      description: 'Latest Android smartphone',
      price: 699.99,
      imageUrl: 'https://via.placeholder.com/150',
      rating: 4.2,
      reviews: [],
    ),
  ];

  List<Product> get products => [..._products];
}
*/

/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductProvider {
  static const _apiUrl = 'http://localhost:8000/api/products/';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
*/

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

class ProductProvider {
  static const _apiUrl = 'http://localhost:8000/api/products/';

  // Fetch products with an optional search query
  Future<List<Product>> fetchProducts({String query = ''}) async {
    // Append the search query to the API URL if it exists
    final response = await http.get(Uri.parse('$_apiUrl?search=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}

