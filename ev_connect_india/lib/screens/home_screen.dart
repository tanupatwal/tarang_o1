import 'package:ev_connect_india/screens/nearby_screen.dart';
import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'pre_booking_screen.dart';
import 'booking_details_screen.dart';
import 'notifications_screen.dart';
import 'payment_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildCurrentStatus(context),
                const SizedBox(height: 24),
                _buildQuickAccess(context),
                const SizedBox(height: 24),
                _buildTopChargingSpots(context),
                const SizedBox(height: 24),
                _buildLocalChargingStations(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome, EV owner!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a location or station',
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        onSubmitted: (value) {
          // TODO: Implement search functionality
        },
      ),
    );
  }

  Widget _buildCurrentStatus(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Status',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Active Booking: No active bookings',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
            const SizedBox(height: 8),
            Text(
              'Nearest Available Station: Green Park Charging Station (2.5 km)',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccess(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Access',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildQuickAccessCard(
                context,
                'Find Nearby',
                Icons.location_on,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NearbyScreen())),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildQuickAccessCard(
                context,
                'Pre-book',
                Icons.event,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PreBookingScreen())),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildQuickAccessCard(
                context,
                'My Bookings',
                Icons.history,
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingDetailsScreen())),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAccessCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.surfaceVariant,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: colorScheme.primary, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopChargingSpots(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top charging spots',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildChargingSpotCard(
          context,
          'Electric Oasis (DE)',
          'Power Hub 17/08/2023',
          'assets/images/charging_station_1.jpeg',
        ),
        const SizedBox(height: 16),
        _buildChargingSpotCard(
          context,
          'Volt Surge (AUS)',
          'Energy Point 19/09/2023',
          'assets/images/charging_station_2.png',
        ),
      ],
    );
  }

  Widget _buildChargingSpotCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PreBookingScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Book'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocalChargingStations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Local charging stations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildLocalStationCard(
                context,
                'Spark Charge',
                'Energy Lounge 19/09/2023',
                'assets/images/local_station_1.png'),
            _buildLocalStationCard(
                context,
                'Current Boost',
                'Charge Center 22/09/2023',
                'assets/images/local_station_2.png'),
            _buildLocalStationCard(context, 'Thundercharge',
                'Power House 23/09/2023', 'assets/images/local_station_3.png'),
            _buildLocalStationCard(context, 'EcoCharge',
                'Charge Zone 29/09/2023', 'assets/images/local_station_4.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildLocalStationCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PreBookingScreen())),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor:
          Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Nearby'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        switch (index) {
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NearbyScreen()));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()));
            break;
          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PaymentScreen()));
            break;
        }
      },
    );
  }
}
