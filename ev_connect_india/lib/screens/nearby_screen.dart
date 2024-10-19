import 'package:flutter/material.dart';
import '../components/charging_station_card.dart';

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Charging Stations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildNearbyStationsList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for charging stations',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (value) {
        // TODO: Implement search functionality
      },
    );
  }

  Widget _buildNearbyStationsList() {
    // This is a placeholder list. In a real app, this would be populated with data from an API or database.
    final List<Map<String, dynamic>> nearbyStations = [
      {
        'name': 'Green Park Charging Station',
        'address': '123 Green Park Road, Delhi',
        'distance': 2.5,
        'available': 3,
        'total': 5,
        'rating': 4.5,
      },
      {
        'name': 'Central Mall EV Charge Point',
        'address': 'Central Mall, MG Road, Bangalore',
        'distance': 3.2,
        'available': 1,
        'total': 4,
        'rating': 4.2,
      },
      {
        'name': 'Tech Park Charging Hub',
        'address': 'Tech Park, Whitefield, Bangalore',
        'distance': 4.7,
        'available': 5,
        'total': 8,
        'rating': 4.8,
      },
    ];

    return Column(
      children: nearbyStations
          .map((station) => ChargingStationCard(
                name: station['name'],
                address: station['address'],
                distance: station['distance'],
                available: station['available'],
                total: station['total'],
                rating: station['rating'],
                onTap: () {
                  // TODO: Navigate to station details page
                },
              ))
          .toList(),
    );
  }
}
