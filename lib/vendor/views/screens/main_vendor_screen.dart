import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/vendor/views/screens/earnings_screen.dart';
import 'package:flutter_application_1/vendor/views/screens/upload_screen.dart';
import 'package:flutter_application_1/vendor/views/screens/vendor_logout_screen.dart';

import 'edit_product_screen.dart';
import 'vendor_order_screen.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditProductScreen(),
    VendorOrderScreen(),
    VendorLougoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.yellow.shade900,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_dollar),
              label: 'GANHOS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'UPLOAD',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'EDITAR',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'PEDIDOS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'LOGOUT',
            ),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
