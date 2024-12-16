import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:traceapp/Admin/bottomnavadmin/AddTransactionpageAdmin/addtransactionpageadmin.dart';
import 'package:traceapp/Admin/bottomnavadmin/addviewdocpage.dart';
import 'package:traceapp/Admin/bottomnavadmin/home/adminhome.dart';
import 'package:traceapp/Passenger/Historypage/historypage.dart';
import 'package:traceapp/Passenger/qrpage/qrpage.dart';
import 'package:traceapp/Passenger/settings/settingspage.dart';

class AdminBottomNavBar extends StatefulWidget {
  const AdminBottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<AdminBottomNavBar> {
  int _currentIndex = 0;

  // Pages to navigate
  final List<Widget> _children = [
    AdminHomePage(),
    AddViewDocumentsPage(),
    TransactionListingPage(),
    SettingsPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.document),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.scan),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
