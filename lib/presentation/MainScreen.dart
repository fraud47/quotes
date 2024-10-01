import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/presentation/home_screen.dart';
import 'package:quotes/presentation/library_screen.dart';
import 'package:quotes/presentation/search_screen.dart';
import 'package:quotes/presentation/settings_screen.dart';
import 'package:quotes/presentation/widgets/CustomNavItem.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);


  int _index = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
    LibraryScreen()

  ];

  set movePage(int index) {
    setState(() => _index = index);
    _pageController.jumpToPage(index);
  }

  set changeIndex(int index) {
    setState(() => _index = index);
  }

  int get currentPosition => _index;

  List<Widget> get pages => _pages;

  PageController get pageController => _pageController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,

        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)
            )

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavItem(icon: 'images/home_icon.svg',
                isSelected: _index == 0,
                label: "Home",
                onTap: () => movePage = 0),
            CustomNavItem(icon: 'images/search.svg',
                isSelected: _index == 1,
                label: "Search",
                onTap: () => movePage = 1),
            CustomNavItem(icon: 'images/folder.svg',
                isSelected: _index == 2,
                label: "library",
                onTap: () => movePage = 2),

            CustomNavItem(icon: 'images/settings.svg',
                label: "Settings",
                isSelected: _index == 3,
                onTap: () => movePage = 3)
          ],
        ),
      ),
      body: SafeArea(
        child:
              PageView(
                controller: _pageController,
                onPageChanged: (int newPage) {
                  changeIndex = newPage;
                },
                children: _pages,
              ),
      ),
    );
  }
}
