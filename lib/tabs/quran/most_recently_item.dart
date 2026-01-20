import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details.dart';

class MostRecentlyItem extends StatelessWidget {
  Sura sura;
  MostRecentlyItem( {required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetails.routename,arguments: sura );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: double.infinity,
        padding: EdgeInsets.only(left:16, ),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(sura.englishName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppTheme.background),),
                  Text(sura.arabicName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppTheme.background)),
                  Text('${sura.ayatCount} Verses',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppTheme.background),),
                ],
              ),
            ),
            Image.asset('assets/images/recently.png',height: MediaQuery.sizeOf(context).height*0.14
              ,width:  MediaQuery.sizeOf(context).width*0.3
              ,fit: BoxFit.fill,)
          ],
        ),
      
      ),
    );
  }

}