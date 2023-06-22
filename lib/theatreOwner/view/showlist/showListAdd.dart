
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../core/dialogue.dart';

class ShowListAdd extends StatelessWidget {
  const ShowListAdd({super.key});

  @override
  Widget build(BuildContext context) {
   // Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            sizedH20,
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Add Show',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            sizedH30,
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(color: textFieldBackground,),
                   itemCount: 3,
                   itemBuilder: (context, index) {
                     return ShowListContainer(showTime: '12:30', startDate: '1-5', endDate: '1-6',);
                   },
                   ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowListContainer extends StatelessWidget {
  const ShowListContainer({
    super.key, required this.startDate, required this.endDate, required this.showTime,
   
  });
final String showTime;
 final String startDate;
 final String endDate;
 // final Size size;

  @override
  Widget build(BuildContext context) {
  final  Size size=MediaQuery.of(context).size;
 

    return Container(
     height: size.height*0.1,
     width: size.width,
                    decoration: BoxDecoration(
     border: Border.all(color: textFieldBackground)
                    ),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Column(
         children: [
         const  Text('ShowTime',style: TextStyle(color: textwhite,fontSize: 15,fontWeight: FontWeight.bold),),
           Text(showTime,style:const TextStyle(color: textwhite),)
         ],
       ),
         Column(
           children: [
          const   Text('ShowTime:',style: TextStyle(color: textwhite,fontSize: 15,fontWeight: FontWeight.bold),),
             Text(startDate,style:const TextStyle(color: textwhite),)
           ],
         ),
           Column(
             children: [
            const   Text('ShowTime:',style: TextStyle(color: textwhite,fontSize: 15,fontWeight: FontWeight.bold),),
               Text(endDate,style:const TextStyle(color: textwhite),)
             ],
           ),
           IconButton(onPressed: (){
            simpleDialogue(context);
           }, icon: Image.asset('assets/images/chat.png',width: 20,))
       ],
     ),
    );
  }
}

