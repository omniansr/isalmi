import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';

class NavBarSelectedIcon  extends StatelessWidget{
  String imageName;

  NavBarSelectedIcon({required this.imageName});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFF202020).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset('assets/icons/$imageName.svg',width: 22,height: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn) ,
      ),
    );
  }
  
}