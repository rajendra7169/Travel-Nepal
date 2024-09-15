import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Nepal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Apply gradient background to match the style
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Header with personalized text
                const SizedBox(height: 50),
                const Text(
                  'Hi Raja, Welcome To Nepal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // Category Tabs (Lake, Mountain, etc.)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryButton('All'),
                    _buildCategoryButton('Lake'),
                    _buildCategoryButton('Mountain'),
                    _buildCategoryButton('Temple'),
                    _buildCategoryButton('City'),
                  ],
                ),
                const SizedBox(height: 20),
                // Section Heading (City, Newly Added, Popular)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'City',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Newly Added', style: TextStyle(color: Colors.grey)),
                    Text('Popular', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                // City Cards
                _buildCityCard(
                  imageUrl: 'assets/kathmandu.jpg',
                  cityName: 'Kathmandu',
                  description:
                      'Kathmandu, Nepal\'s capital, is set in a valley surrounded by the Himalayan mountains.',
                ),
                _buildCityCard(
                  imageUrl: 'assets/biratnagar.jpg',
                  cityName: 'Biratnagar',
                  description:
                      'Biratnagar is a metropolitan municipality and the second-largest city of Nepal.',
                ),
                _buildCityCard(
                  imageUrl: 'assets/pokhara.jpg',
                  cityName: 'Pokhara',
                  description:
                      'Pokhara is a great destination for a weekend getaway as well as a long relaxing holiday.',
                ),
              ],
            ),
          ),
        ),
      ),
      // Custom Bottom Navigation Bar to match the theme
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        selectedItemColor: Colors.blue.shade700,
      ),
    );
  }

  // Button to represent categories with elevated style and blue color
  Widget _buildCategoryButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade700, // Text color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  // Card UI for City details including booking options
  Widget _buildCityCard({
    required String imageUrl,
    required String cityName,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.asset(imageUrl,
                height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cityName,
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 12),
                // Wrap instead of Row to prevent overflow
                Wrap(
                  spacing: 8.0, // Adds space between buttons
                  runSpacing: 4.0, // Adds space between rows if wrapped
                  children: [
                    _buildActionButton('Book A Flight'),
                    _buildActionButton('Book A Hotel'),
                    _buildActionButton('Places To Visit'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Action buttons (e.g., Book A Flight, Book A Hotel)
  Widget _buildActionButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label, style: const TextStyle(fontSize: 12)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700, // Text color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
    );
  }
}
