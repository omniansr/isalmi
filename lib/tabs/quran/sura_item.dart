import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura ;
  SuraItem(this.sura);

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Container(
         height: 52,
           width: 52,
           decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/images/sura_number.png'))
           ),
           alignment: .center,
           child: Text('${sura.num}',style: Theme.of(context).textTheme.titleLarge,)),
       SizedBox(width: 24,),
       Column(
         crossAxisAlignment: .start,
         mainAxisAlignment: .spaceBetween,
         children: [
           Text(sura.englishName, style:Theme.of(context).textTheme.titleLarge,),
           Text('${sura.ayatCount} Verses', style: Theme.of(context).textTheme.titleSmall,)
         ],
       ),
       Spacer(),
       Text(sura.arabicName, style: Theme.of(context).textTheme.titleLarge,)
     ],
   );
  }

}