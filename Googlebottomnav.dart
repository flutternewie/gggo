import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screen/employmentPage.dart';
import '../screen/home_page.dart';
import '../screen/myPage.dart';
import '../screen/searchPage.dart';

class GoogleNav extends StatefulWidget {
  @override
  _GoogleNavState createState() => _GoogleNavState();
}

class _GoogleNavState extends State<GoogleNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    EmployPage(),
    SearchPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset('asset/logo.png',
            height: 200.0,
            width: 100.0,
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 28,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 300),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.badge_rounded,
                  text: 'Employ',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'My',
                ),
              ],
              // showBottomSheet를 추가하고 싶음 없애면 정상 작동 중.
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  if(index==3){
                    showBottomSheet(context: context,
                        builder: (BuildContext context){
                          return Container(
                              height: 200);
                        }
                    );
                    _selectedIndex = index;
                  }
                  else {
                    _selectedIndex = index;
                  }
                },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
