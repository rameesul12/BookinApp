import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CouponCard extends StatelessWidget {

   CouponCard({
    super.key,
   required this.imagepath, required this.texttitle
  });
   final String texttitle;
    String imagepath;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
            height: size.height *0.1,
            width:size.width *0.6 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            color:buttonColor.withOpacity(0.4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sizedH30,
              Align(
              //  alignment: Alignment.topCent,
                child: Container(
                  height: 80,
                  width: 90,
                   decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                
                image: 
              AssetImage(imagepath),fit: BoxFit.fill),
                  // color: Colors.white,
                  ),
                
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                  //  mainAxisAlignment: main,
                    children: [
                      sizedH30,
                        Text(texttitle,style:const TextStyle(
                         // overflow: TextOverflow.fade,
                          color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                        //  sizedH10,
                         const Text('30%',style: TextStyle(color: Colors.amber,fontSize: 30,fontWeight: FontWeight.bold),),
                        const  ColoredBox(color: Colors.black87,
                          child: Text('Apply Now ',style: TextStyle(color:textwhite),),
                          )
                    ],
                  ),
                ),
               
            ]),
            
            
            
      ),
    );
  }
}
