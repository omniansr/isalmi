import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected_icon.dart';
import 'package:islami/nav_bar_unselected_icon.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/quran/quran.dart';
import 'package:islami/tabs/radio/radio.dart';
import 'package:islami/tabs/sebha/sebha.dart';
import 'package:islami/tabs/time/time.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{

  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  List<String> backgroundPath =[
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/${backgroundPath[currentIndex]}.png'),
          fit: BoxFit.fill)
        ),
        child: Column(
          children: [
            Image.asset('assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.17 ,
            fit: BoxFit.fitWidth,),

            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ) ,
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