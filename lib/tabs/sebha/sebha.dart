import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget{
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  final List<String> zekrList = [
    "سُبْحان اللـه",
    "الحِمْد ُللــه",
    "اللـه أِكْبر"
  ];
  double angle = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text('سِبِح اسْم رَبِكَ الأَعْلَى', style: Theme.of(context).textTheme.headlineLarge,textAlign: .center,),
        Stack(
        alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/images/sharshoba.png',height: MediaQuery.sizeOf(context).height *.14,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * .11),
                child: Stack(
                  alignment: .center,
                  children:[
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(counter == 33){
                            index=  (index+1) % zekrList.length;
                            counter =0;
                          }else{
                          counter++;
                          }
                          angle +=  0.1;
                        });
                      },
                      child: Transform.rotate(
                        angle: -angle,
                        child: Image.asset('assets/images/sebha_body.png',
                        height: MediaQuery.sizeOf(context).height * .4,
                                          fit: BoxFit.fill,),
                      ),
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        Text('${zekrList[index]}',style: Theme.of(context).textTheme.headlineLarge),
                        Text('$counter',style: Theme.of(context).textTheme.headlineLarge)
                      ],
                    )

                  ],
                )
            ),


          ],
        )

      ],
    );

  }
}