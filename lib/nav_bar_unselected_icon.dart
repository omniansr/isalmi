import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarUnselectedIcon extends StatelessWidget {
  String imageName;

  NavBarUnselectedIcon({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/$imageName.svg',width: 28,height: 28,
    fit: BoxFit.fill,
    );
  }

}