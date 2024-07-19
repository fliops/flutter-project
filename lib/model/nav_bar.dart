import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:rshttk/screen/home_screen.dart';
import 'package:rshttk/screen/halp.dart';
import 'package:rshttk/screen/tracking.dart';
import 'package:rshttk/screen/prescription.dart';

class Normal extends StatefulWidget {
  const Normal({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _NormalState createState() => _NormalState();
}

class _NormalState extends State<Normal> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Prescription(),
     const Tracking(),
    const Halp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: const Color(0xffE3F1FC),
        curve: Curves.linear,
        itemCornerRadius: 15,
        containerHeight: 85,
        iconSize: 32,
        showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: const Color(0xFF247ABF),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.description),
            title: const Text('Prescription' ,),
            activeColor: const Color(0xFF247ABF),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add_box),
            title: const Text('Tracking'),
            activeColor: const Color(0xFF247ABF),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.help),
            title: const Text('Help'),
            activeColor: const Color(0xFF247ABF),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
