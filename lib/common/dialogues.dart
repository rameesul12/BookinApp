
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



  getError(String error,BuildContext ctx){
 return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(backgroundColor: Colors.black,content: Text(error,style:const TextStyle(color: Colors.white),)));
} 





  lottieshowing(BuildContext context){
  showDialog(context:context, builder:(context) {
    return SizedBox(
      height: 30,
      width: 20,
       child:  Lottie.asset("assets/animation/animation_lk15dry5.json")
    ) ;
  },);
  }

 


