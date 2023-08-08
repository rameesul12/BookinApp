import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';

simpleDialogues(BuildContext context,){
  showDialog(context: context, builder: (context) => SimpleDialog(
    backgroundColor: textFieldBackground,
    children: [
      TextButton(onPressed: (){}, child:const Text('Edit',style: TextStyle(color:textwhite),)),
      TextButton(onPressed: (){}, child:const Text('delete',style: TextStyle(color:textwhite),)),
      
    ],
  ));
}