import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  bool onBoarding = prefs.getBool('onBoarding') ?? false;

  runApp(islami(onBoarding: onBoarding));
}

class islami extends StatelessWidget {
  final bool onBoarding;

  islami({required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {HomeScreen.routename: (_) => HomeScreen(),
      OnboardingScreen.routename:(_) => OnboardingScreen()},
      initialRoute: onBoarding ? HomeScreen.routename : OnboardingScreen.routename,
    );
  }
}


