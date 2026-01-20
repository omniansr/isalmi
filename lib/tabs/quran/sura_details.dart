import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetails extends StatefulWidget {
  static const String routename = 'suradetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();

}

class _SuraDetailsState extends State<SuraDetails> {
  late Sura sura;
  List<String> ayat =[];

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.sizeOf(context).height;
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if(ayat.isEmpty) {
      loadSura();
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(sura.englishName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppTheme.primary,),)
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Image.asset('assets/images/left_corner.png',height: screenheight *.1,fit: BoxFit.fill,),
                Text(sura.arabicName,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppTheme.primary,),),
                Image.asset('assets/images/right_corner.png',height: screenheight *.1,fit: BoxFit.fill,),
              ],
            ),
          ),
          Expanded(
              child: ayat.isEmpty
                  ? LoadingIndicator()
              : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              itemBuilder: (_,index) => Text(ayat[index],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppTheme.primary,),
                textAlign: .center,),
              separatorBuilder: (_,_) => SizedBox(height: 12,),
              itemCount: ayat.length)),
          SafeArea(
            bottom: true,
            child: Image.asset('assets/images/bottom_decoration.png',width: double.infinity,
              fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }

 Future<void> loadSura() async{
  String suraFileContent = await rootBundle.loadString('assets/texts/${sura.num}.txt');
  ayat = suraFileContent.split('\r\n');
  setState(() {});
  }
}