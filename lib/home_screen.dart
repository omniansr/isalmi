import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected_icon.dart';
import 'package:islami/nav_bar_unselected_icon.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex=index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: NavBarUnselectedIcon(imageName: 'quran'),
              activeIcon: NavBarSelectedIcon(imageName: 'quran'),
              label: 'Quran',

            ),
            BottomNavigationBarItem(
              icon: NavBarUnselectedIcon(imageName: 'hadeth'),
              activeIcon: NavBarSelectedIcon(imageName: 'hadeth'),
              label: 'Hadeth',
            ), BottomNavigationBarItem(
              icon: NavBarUnselectedIcon(imageName: 'sebha'),
              activeIcon: NavBarSelectedIcon(imageName: 'sebha'),
              label: 'Sebha',
            ), BottomNavigationBarItem(
              icon: NavBarUnselectedIcon(imageName: 'radio'),
              activeIcon: NavBarSelectedIcon(imageName: 'radio'),
              label: 'Radio',
            ), BottomNavigationBarItem(
              icon: NavBarUnselectedIcon(imageName: 'time'),
              activeIcon: NavBarSelectedIcon(imageName: 'time'),
              label: 'Time',
            ),
          ]),
    );
  }


}