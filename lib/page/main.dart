import 'package:teng_go/page-login/login.dart';
import 'package:teng_go/page-login/splash-screen.dart';
import 'package:teng_go/page/approval.dart';
import 'package:teng_go/page/attendance.dart';
import 'package:teng_go/page/home.dart';
import 'package:teng_go/page/leaverequest.dart';
import 'package:teng_go/page/notification.dart';
import 'package:teng_go/page/overtime.dart';
import 'package:teng_go/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final screens = [
    HomePage(),
    NotificationScreen(),
    AttendanceScreen(),
    ApprovalScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) => setState(() => this.index = index),
          backgroundColor: Colors.white,
          selectedIndex: index,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              label: 'Attendance',
            ),
            NavigationDestination(
              icon: Icon(Icons.battery_saver),
              label: 'Approval',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ]),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.white,
      //   buttonBackgroundColor: fromCssColor('#8DB8FE'),
      //   color: fromCssColor('#4785EA'),
      //   index: index,
      //   onTap: (index) => setState(() => this.index = index),
      //   items: [
      //     const Icon(
      //       Icons.work_history_rounded,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     const Icon(
      //       Icons.home,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     const Icon(
      //       Icons.person_2,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //   ],
      // )
    );
  }
}
