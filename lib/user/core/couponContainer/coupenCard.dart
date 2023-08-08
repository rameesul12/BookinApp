import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CouponCard extends StatelessWidget {

   CouponCard({
    super.key,
   required this.imagepath, required this.texttitle,required this.releasingDate
  });
   final String texttitle;
   final String releasingDate;
    String imagepath;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child:imagepath.isEmpty?const Center(child: CircularProgressIndicator(),):
       Stack(
        children: [
          SizedBox(
                height: size.height *0.3,
                width:size.width *0.8 ,
               
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network("https://www.themoviedb.org/t/p/w300_and_h450_bestv2$imagepath",
                  width: size.width,
                  fit: BoxFit.fitWidth,
                           
                  
                  ),
                ),
                
                
                
          ),
          Positioned(
            bottom: 80,
            left: 20,
           // top: 10,
            child:  AnimatedTextKit(
              isRepeatingAnimation: true,
              animatedTexts: [
            TyperAnimatedText( '$texttitle\n$releasingDate' ,textStyle:const TextStyle(color: textwhite,fontSize: 30,fontWeight: FontWeight.bold)),
       //   TyperAnimatedText(,textStyle:const TextStyle(color: textwhite,fontSize: 30,fontWeight: FontWeight.bold))
          ]),
        ),
        ],
      ),
    );
  }
}
