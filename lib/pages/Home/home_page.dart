import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Forum/questions_page.dart';
import 'package:flutter_app/pages/Opportunities/opportunities_page.dart';
import 'package:flutter_app/pages/auth/account_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PageControllers for page view
  PageController _pageController = PageController();

  // Lists of pages for Page View
  List<Widget> _screens = [
    OpportunitiesPage(),
    QuestionsPage(),
    AccountPage(),
  ];

  // Selecte index
  int _selectedIndex = 0;

  // Page View onPageChanged
  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void _onItemTapped(int itemIndex) {
    _pageController.jumpToPage(itemIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Opportunities',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Forums',
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            label: 'Accounts',
            icon: Icon(Icons.person),
          )
        ],
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
