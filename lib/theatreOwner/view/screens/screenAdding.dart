

import 'package:bookingapp/user/core/textformfield.dart';
import 'package:flutter/material.dart';

import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';

class ScreenAdding extends StatelessWidget {
  const ScreenAdding({super.key});

  @override
  Widget build(BuildContext context) {
TextEditingController rowController=TextEditingController();
TextEditingController columnController=TextEditingController();


 //   Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              sizedH20,
            //  Text('My screens',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold),),
              sizedH30,
             /* Container(
              width:size.width*0.4 ,
              height: size.height*0.1,
              decoration: BoxDecoration(
                border: Border.all(color: colorTextwhite),
                
              ),
              child: Row(children: [
        
              ],),
             ) */
             Text('How many rows?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
             TextformField1(hintText: 'Enter Rows', textController:rowController , textIcon: Icons.table_rows_outlined,),
             sizedH20,
              Text('How many columns?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
             TextformField1(hintText: 'Enter Rows', textController:columnController , textIcon: Icons.table_rows_outlined,),
               sizedH20,
              Text('Total Seats',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
             TextformField1(hintText: 'seats ', textController:columnController , textIcon: Icons.table_rows_outlined,),
            sizedH30,
             ElevatedButton(onPressed: (){}, child: Text('Add Screen',style: TextStyle(color: textwhite),),style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
             ),)
            ],
          ),
        ),
      ),
    );
  }
}