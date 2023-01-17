import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicoo/MainViews/Home/home.dart';
import 'package:musicoo/MainViews/Search/search.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int index = 0;
  List<Widget> screen = [Home(), Container(), Container(), Library()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home_filled,
                  color: Color(0xFF92E3A9),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                activeIcon: Icon(
                  Icons.search,
                  color: Color(0xFF92E3A9),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Color(0xFF92E3A9),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: 'My Library',
                activeIcon: Icon(
                  Icons.image,
                  color: Color(0xFF92E3A9),
                ))
          ]),
    );
  }
}
