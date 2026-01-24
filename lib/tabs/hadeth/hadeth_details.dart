import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_model.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethDetails extends StatefulWidget {
  static const String routename = 'hadethdetails';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();

}

class _HadethDetailsState extends State<HadethDetails> {
  late HadethModel hadeth;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.sizeOf(context).height;
    hadeth = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(
          title: Text('Hadeth${hadeth.num}',
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
                Expanded(
                  child: Text(hadeth.title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppTheme.primary,),textAlign: .center,),
                ),
                Image.asset('assets/images/right_corner.png',height: screenheight *.1,fit: BoxFit.fill,),
              ],
            ),
          ),
          Expanded(
              child: hadeth==null
                  ? LoadingIndicator()
                  : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  itemBuilder: (_,index) => Text(hadeth.content[index],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.primary,),
                    textAlign: .center,),
                  separatorBuilder: (_,_) => SizedBox(height: 12,),
                  itemCount: hadeth.content.length)),
          SafeArea(
            bottom: true,
            child: Image.asset('assets/images/bottom_decoration.png',width: double.infinity,
              fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }


}