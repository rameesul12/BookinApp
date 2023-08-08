

// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/model/screen_Adding/screen_adding.dart';
import 'package:bookingapp/user/core/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';
import '../../controller/provider/add_Screen/current_owner_provider.dart';

// ignore: must_be_immutable
class ScreenAdding extends StatelessWidget {
   ScreenAdding({super.key, this.checking=false,this.index=0});
  bool checking;
 int index;
 List<ScreenDeatails>array=[];
  @override
  Widget build(BuildContext context) {
   final formkey=GlobalKey<FormState>(); 

final provider=Provider.of<AddScreenProvider>(context,listen: false);

 //   Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key:formkey,
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
               const Text('Screen Number..',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
               TextformField1(hintText: 'Enter screen number', textController:provider.screenController , textIcon: Icons.table_rows_outlined,),
               sizedH20,
                const Text('How many Rows?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
               TextformField1(hintText: 'Enter Rows', textController:provider. rowController , textIcon: Icons.table_rows_outlined,),
                 sizedH20,
                const Text('How many Colums?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
               TextformField1(hintText: 'column ', textController:provider. columnController , textIcon: Icons.table_rows_outlined,),
              sizedH30,
               ElevatedButton(onPressed: () async{
                if (formkey.currentState!.validate()) {
                  
               if (checking==false) {
                 
                 
                  lottieshowing(context);

                 await provider.addScreenPost(context);
                 await provider.getScreen(context);
                 Navigator.pop(context);
                 
                 
                 provider.columnController.clear();
                 provider.rowController.clear();
                 provider.screenController.clear();
               }else{
                lottieshowing(context);
              
                await provider.editScreen(context, index);
               
                checking=false;
                Navigator.pop(context);
                  provider.columnController.clear();
                 provider.rowController.clear();
                 provider.screenController.clear();
               }
                }else{
                  getError("please fill the empty field", context);
                }
               },style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
               ), child: const Text('Add Screen',style: TextStyle(color: textwhite),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}