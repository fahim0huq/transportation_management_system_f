import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tms_iiuc/navbar2/dot_curved_bottom_nav.dart';
import 'package:tms_iiuc/pages/location_map.dart';
import 'package:tms_iiuc/pages/return.dart';
import 'authority/author.dart';
import 'navbar/curved_navigation_bar.dart';
import 'pages/allocation.dart';
import 'pages/others.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of page routes
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;


  final List<Widget>_Pages = [
    const LocationMap(),
    const Allocation(),
    const Return(),
    const Others(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages[_currentPage],
      // bottomNavigationBar: CurvedNavigationBar(
      //         backgroundColor: Colors.purple.shade50,
      //         items: <Widget>[
      //           Icon(Icons.add, size: 30),
      //           Icon(Icons.list, size: 30),
      //           Icon(Icons.compare_arrows, size: 30),
      //           Icon(Icons.compare_arrows, size: 30),
      //         ],
      //         onTap: (index) {
      //           //Handle button tap
      //         },
      //       ),
      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: _scrollController,
        hideOnScroll: true,
        indicatorColor: Colors.purple,
        backgroundColor: Colors.purple.shade300,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        selectedIndex: _currentPage,
        indicatorSize: 5,
        borderRadius: 25,
        height: 70,
        onTap: (index) {
          setState(() => _currentPage = index);
        },
        items: [
          Icon(
            Icons.home,
            color: _currentPage == 0 ? Colors.purple : Colors.white,
          ),
          Icon(
            Icons.notification_add,
            color: _currentPage == 1 ? Colors.purple : Colors.white,
          ),
          Icon(
            Icons.color_lens,
            color: _currentPage == 2 ? Colors.purple : Colors.white,
          ),
          Icon(
            Icons.person,
            color: _currentPage == 3 ? Colors.purple : Colors.white,
          ),
        ],
      ),

    );
  }
}