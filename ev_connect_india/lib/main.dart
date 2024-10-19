import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(const EVStationHubApp());
}

class EVStationHubApp extends StatelessWidget {
  const EVStationHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EV Connect India',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primarySeedColor,
          brightness: Brightness.light,
        ).copyWith(
          secondary: AppColors.primarySeedColor,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primarySeedColor,
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
