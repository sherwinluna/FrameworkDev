import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.register,
      onGenerateRoute: RouteManager.generateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Dummy banners and product data
  final List<String> banners = [
    'https://via.placeholder.com/400x150.png?text=Festive+Banner+1',
    'https://via.placeholder.com/400x150.png?text=Festive+Banner+2',
    'https://via.placeholder.com/400x150.png?text=Festive+Banner+3',
  ];

  final List<Map<String, String>> products = [
    {"title": "Smartwatch", "price": "24.00", "image": "https://via.placeholder.com/100"},
    {"title": "Headphones", "price": "19.99", "image": "https://via.placeholder.com/100"},
    {"title": "Charger", "price": "12.00", "image": "https://via.placeholder.com/100"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategory("Electronics"),
                    _buildCategory("Cases"),
                    _buildCategory("Accessories"),
                    _buildCategory("Mobiles"),
                  ],
                ),
              ),
            ),

            // Banner Carousel
            CarouselSlider(
              items: banners.map((url) {
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
            ),

            // Section Title
            _buildSectionTitle("Top Products", () {
              //print("View all clicked!");
            }),

            // Product Grid
            GridView.builder(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  // Category Widget
  Widget _buildCategory(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Chip(
        label: Text(title),
        backgroundColor: Colors.orange.shade100,
      ),
    );
  }

  // Product Card Widget
  Widget _buildProductCard(Map<String, String> product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product["image"]!,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product["title"]!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "\$${product["price"]}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title, VoidCallback onViewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: const Text(
              "View All",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
