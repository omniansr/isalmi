import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(Contact());
}

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routename :(_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routename,
    );
  }
}
