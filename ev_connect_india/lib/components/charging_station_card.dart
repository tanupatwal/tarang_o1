// TODO Implement this library.
import 'package:flutter/material.dart';

class ChargingStationCard extends StatelessWidget {
  final String name;
  final String address;
  final double distance;
  final int available;
  final int total;
  final double rating;
  final VoidCallback onTap;

  const ChargingStationCard({
    Key? key,
    required this.name,
    required this.address,
    required this.distance,
    required this.available,
    required this.total,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                address,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoChip(
                      Icons.location_on, '${distance.toStringAsFixed(1)} km'),
                  _buildInfoChip(
                      Icons.ev_station, '$available/$total available'),
                  _buildInfoChip(Icons.star, rating.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
