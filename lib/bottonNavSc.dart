import 'package:evergreen_seed/UserSc.dart';
import 'package:flutter/material.dart';

import 'explore.dart';
import 'main.dart';
import 'signup.dart';

class BottomNavBar extends StatefulWidget {
  final String? username;
   const BottomNavBar({super.key, this.username});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screen = [
      HomeSc(username: widget.username),
      const Explore(),
      const UserSc(),
    ];

    return Scaffold(

      body: screen[_currentIndex],

      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(229, 210, 241, 1.0),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 14,
          unselectedFontSize: 12,

          currentIndex: _currentIndex,

          items: const [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: 'User'

            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
