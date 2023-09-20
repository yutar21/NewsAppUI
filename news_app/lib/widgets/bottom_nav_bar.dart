import 'package:flutter/material.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/screens/discover_screen.dart';
import 'package:news_app/screens/home_screen.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Container(
            margin: const EdgeInsets.only(left: 50),
            child: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, DiscoverScreen.routeName);
            },
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Container(
            margin: EdgeInsets.only(right: 50),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                print("No profile screen yet.");
              },
            ),
          ),
        ),
      ],
    );
  }
}
