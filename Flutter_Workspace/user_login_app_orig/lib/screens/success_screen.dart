/*import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Success')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text('Operation Successful!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.orange),
        title: Image.asset(
          'assets/alibaba_logo.png', // Replace with your logo image
          height: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.orange),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

            // Category Tabs
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryTab('ELECTRONICS', true),
                  _buildCategoryTab('CASES', false),
                  _buildCategoryTab('ACCESSORIES', false),
                  _buildCategoryTab('Mobiles', false),
                ],
              ),
            ),

            // Image Carousel (Banner)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: 150,
                child: PageView(
                  children: [
                    _buildBanner('Feel Festive', 'Top-selling, cost-effective products for the holiday season.', 'assets/festive_banner.png'),
                    _buildBanner('Winter Deals', 'Best deals for the winter season.', 'assets/winter_deals.png'),
                  ],
                ),
              ),
            ),

            // Top Products Section
            _buildProductSection('Top Products', [
              _buildProductCard('Smart Watch', '24.00', 'assets/watch.png'),
              _buildProductCard('Phone Case', '12.00', 'assets/case.png'),
              _buildProductCard('Headphones', '30.00', 'assets/headphones.png'),
            ]),

            // Accessories Section
            _buildProductSection('Accessories', [
              _buildProductCard('USB Cable', '8.00', 'assets/cable.png'),
              _buildProductCard('Smart Plug', '15.00', 'assets/smart_plug.png'),
              _buildProductCard('LED Light', '10.00', 'assets/led.png'),
            ]),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
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
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Wishlist',
          ),
        ],
      ),
    );
  }

  // Helper method to create category tabs
  Widget _buildCategoryTab(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
      ),
    );
  }

  // Helper method to create banners
  Widget _buildBanner(String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create product sections
  Widget _buildProductSection(String sectionTitle, List<Widget> products) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text('View All')),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: products,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create product cards
  Widget _buildProductCard(String title, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
          Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

