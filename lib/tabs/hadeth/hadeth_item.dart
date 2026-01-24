import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/tabs/hadeth/hadeth_model.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  int index;

   HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
   HadethModel? hadeth;

  @override
  Widget build(BuildContext context) {
    if(hadeth == null)
      {
        loadHadeth();
      }
     return InkWell(
     onTap: () => Navigator.of(context).pushNamed(HadethDetails.routename,arguments: hadeth),
     child: Container(
       decoration: BoxDecoration(
         color: AppTheme.primary,
         borderRadius: BorderRadius.circular(20),
       ),
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:  8,vertical: 8),
             child: Row(
               mainAxisAlignment: .spaceBetween,
               children: [
                 Image.asset('assets/images/left_corner_hadeth.png',
                 height: MediaQuery.sizeOf(context).height * 0.1,
                   fit: BoxFit.fill,),
                 if(hadeth != null)
                 Expanded(
                     child: Text(hadeth!.title,
                   style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppTheme.background),
                 textAlign: TextAlign.center,)),
                 Image.asset('assets/images/right_corner_hadeth.png',
                     height: MediaQuery.sizeOf(context).height * 0.1,
                     fit: BoxFit.fill),
               ],
             ),
           ),
           SizedBox(height: 10,),
           Expanded(
             child: Container(
               height: double.infinity,
               width:  double.infinity,
               decoration: BoxDecoration(
                 image: DecorationImage(image:AssetImage('assets/images/hadithcardbackground.png') )
               ),
               child: hadeth == null ? LoadingIndicator(color: AppTheme.background,)
               :ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                   padding: EdgeInsets.symmetric(horizontal: 20),
                   itemBuilder:(_,index) =>  Text(hadeth!.content[index],
                   style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.background),
               textAlign: TextAlign.center,),
                   separatorBuilder: (_,index) => SizedBox(height: 4,),
                   itemCount: hadeth!.content.length),
             ),
           ),
           Image.asset('assets/images/hadeth_bottom.png',width: double.infinity,fit: BoxFit.fill,),
         ],
       ),
     ),
   );
  }

  Future<void> loadHadeth() async{
    String hadethFileContent = await rootBundle.loadString('assets/texts/h${widget.index+1}.txt');
    List<String> hadethcontent = hadethFileContent.split('\n');
    String title = hadethcontent[0];
    hadethcontent.removeAt(0);
    List<String> content = hadethcontent;
    hadeth= HadethModel(title: title, content: content, num: widget.index+1);
    setState(() {});
  }
}