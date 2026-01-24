import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  Color? color;
  LoadingIndicator({Color? color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color?? AppTheme.primary,),
    );
  }

}