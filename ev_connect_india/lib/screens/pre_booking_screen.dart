import 'package:flutter/material.dart';

class PreBookingScreen extends StatelessWidget {
  const PreBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pre-book a Station')),
      body: const Center(
          child: Text('Pre-booking Screen - Implement booking form here')),
    );
  }
}
