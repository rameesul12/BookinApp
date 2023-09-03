import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class AppBarcontainer extends StatelessWidget {
  String? leadingPath;
  String? title;
  Widget? trailNavigate;
String? actionPath;
   AppBarcontainer({super.key,this.leadingPath,this.title,this.actionPath,this.trailNavigate});

  @override
  Widget build(BuildContext context) {
 Size size=MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      color: backgroundColor,
      child: Stack(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingPath==null?const SizedBox(
            width: 0,
          ):
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height:25,
            width: size.width*0.25,
            child: Image.asset(leadingPath!)),
        ),
        // sizedW40,
        // sizedH20,
        title == null ?const SizedBox(
            width: 0,
          ): Align(
            alignment: Alignment.center,
            child: Text('$title',style:const TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 20),)),
          actionPath==null?const SizedBox(
            width: 0,
          ):
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
         //   onTap: () =>navigateFunction(context,trailNavigate!) ,
            child: SizedBox(
              height:30 ,
              width: size.width*0.2,
              child: Image.asset(actionPath!,)),
          ),
        ),
        ],
      ),
    );

  }
}