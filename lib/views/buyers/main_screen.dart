import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/buyers/nav_screens/account_screen.dart';
import 'package:flutter_application_1/views/buyers/nav_screens/cart_screen.dart';
import 'package:flutter_application_1/views/buyers/nav_screens/category_screen.dart';
import 'package:flutter_application_1/views/buyers/nav_screens/home_screen.dart';
import 'package:flutter_application_1/views/buyers/nav_screens/search_screen.dart';
import 'package:flutter_application_1/views/buyers/nav_screens/store_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreeState();
}

class _MainScreeState extends State<MainScreen> {
  int _pageIndex = 0;
  
  List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    StoreScreen(),
    CartScreen(),
    SearchScreen(),
    AccountScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      
        currentIndex: _pageIndex,
        onTap: (value){
          setState(() {
            _pageIndex = value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor:  Color.fromRGBO(64, 0, 66, 1),
        items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/explore.svg',
           width: 20,),
          label: 'CATEGORIAS',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/shop.svg',
           width: 20,),
          label: 'LOJA',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/cart.svg'),
          label: 'CARRINHO',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          label: 'PESQUISA',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/account.svg'),
          label: 'CONTA',
        ),
      ]),

      body: _pages[_pageIndex],
    );
  }
}
