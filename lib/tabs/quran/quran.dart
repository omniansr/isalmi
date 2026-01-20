import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/most_recently_item.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details.dart';
import 'package:islami/tabs/quran/sura_item.dart';

class QuranTab extends StatefulWidget{
  @override
  State<QuranTab> createState() => _QuranTabState();
}


class _QuranTabState extends State<QuranTab> {



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset('assets/icons/sura_icon.svg', height: 28,width: 28,fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(AppTheme.primary, BlendMode.srcIn) ,)
            ),
            onChanged: (query){
             QuranService.searchSura(query);
             setState(() {
             });
             },
          ),
        ),
        Visibility(
          visible:QuranService.mostRecentlySuras.isNotEmpty,
          child:Padding(
              padding: EdgeInsets.only(top: 20.0,left: 20),
              child:Column(crossAxisAlignment: .start,
              children: [
              Text('Most Recently',
              style:Theme.of(context).textTheme.titleMedium ,),
              SizedBox(height: 10,),
              SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15 ,
              child: ListView.separated(
              scrollDirection: Axis.horizontal,
             itemBuilder: (_,index) => MostRecentlyItem(sura:QuranService.mostRecentlySuras.reversed.toList()[index]),
             separatorBuilder: (_,_) => SizedBox(width: 10,),
             itemCount: QuranService.mostRecentlySuras.length,
        ),
      ),
    ],
    )
        ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: Text('Suras List',
            style:Theme.of(context).textTheme.titleMedium ,),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            itemBuilder: (_,index){
              Sura sura = QuranService.suras[index];
              return InkWell(
              child: SuraItem(sura),
              onTap:() async{
              QuranService.addSuraToMostRecently(sura);

              await Navigator.of(context).pushNamed(SuraDetails.routename,
                arguments: sura);
                setState(() {});
                },);
              },
            itemCount: QuranService.suras.length,
            separatorBuilder: (_,_) => Divider(
            color: AppTheme.white,
            thickness: 1,
            indent: screenWidth * 0.1,
            endIndent: screenWidth * 0.1,
          ) ,),
        )
      ],
    );
  }
}