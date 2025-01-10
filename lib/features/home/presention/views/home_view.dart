import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/bookings_tab_view.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/properties/properties_tab_view.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/users/users_tab_view.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  List<Widget> taps = [
    UsersTabView(),
    PropertiesTabView(),
    BookingsTabView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trip_origin),
            label: 'Bookings',
          ),
        ],
      ),
    );
  }
}
