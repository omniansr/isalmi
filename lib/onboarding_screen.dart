import 'package:flutter/material.dart';
import 'package:islami/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routename = 'onbording';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> pages =[
    OnboardingModel(image: 'assets/images/introduction1.png',
        title: 'Welcome To Islmi App', body: ""),
    OnboardingModel(image: 'assets/images/introduction2.png',
        title: 'Welcome To Islami',
        body: 'We Are Very Excited To Have You In Our Community'),
    OnboardingModel(image: 'assets/images/introduction3.png',
        title: 'Reading the Quran',
        body: 'Read, and your Lord is the Most Generous'),
    OnboardingModel(image: 'assets/images/introduction4.png',
        title: 'Bearish',
        body: 'Praise the name of your Lord, the Most High'),
    OnboardingModel(image: 'assets/images/introduction5.png',
        title: 'Holy Quran Radio',
        body: 'You can listen to the Holy Quran Radio through the application for free and easily')
  ];

  Future<void> finshOnBoarding(BuildContext context) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', true);

    Navigator.pushReplacementNamed(context, HomeScreen.routename);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Image.asset('assets/images/header.png',
            height: MediaQuery.sizeOf(context).height * 0.17,
            fit: BoxFit.fitWidth,),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      pages[index].image,
                      height: 320,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 30),

                    Text(
                      pages[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppTheme.primary,),
                    ),

                    const SizedBox(height: 40),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        pages[index].body,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppTheme.primary,),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),

          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  if(currentIndex > 0)
                  TextButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color:  AppTheme.primary ),
                    ),
                  ),

                  const Spacer(),

                  Row(
                    children: List.generate(
                      pages.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentIndex == index ? 18 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ?  AppTheme.primary
                              : AppTheme.gray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  TextButton(
                    onPressed: () {
                      if (currentIndex == pages.length - 1) {
                        finshOnBoarding(context);
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: currentIndex == pages.length - 1 ?
                    Text('Finish',
                      style: TextStyle(color: AppTheme.primary),
                    ):
                    Text('Next',
                      style: TextStyle(color: AppTheme.primary),
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}