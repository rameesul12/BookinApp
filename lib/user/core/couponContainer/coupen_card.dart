import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CouponCard extends StatelessWidget {

   CouponCard({
    super.key,
   required this.imagepath, required this.overview,required this.releasingDate
  });
   final String overview;
   final String releasingDate;
    String imagepath;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child:imagepath.isEmpty?const Center(child: CircularProgressIndicator(),):
      //  Stack(
      //   children: [
          FlipCard(
            direction: FlipDirection.HORIZONTAL,
            flipOnTouch: true,
            speed: 500,
            front: SizedBox(
                  height: size.height *0.3,
                  width:size.width *0.6 ,
                 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("https://www.themoviedb.org/t/p/w300_and_h450_bestv2$imagepath",
                    width: size.width,
                    fit: BoxFit.fill,
                             
                    
                    ),
                  ),
                  
                  
                  
            ),
            back: Container(
               height: size.height *0.3,
                  width:size.width *0.6 ,
                  decoration: BoxDecoration(
                    color:textFieldBackground ,
                     borderRadius: BorderRadius.circular(10),

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AnimatedTextKit(
                                  isRepeatingAnimation: true,
                                  animatedTexts: [
                                TyperAnimatedText('Release:$releasingDate' ,textStyle:const TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
                             // TyperAnimatedText(overview,textStyle:const TextStyle(color: textwhite,fontSize: 2,fontWeight: FontWeight.bold))
                              ]),
                            const  Text("overview:",style: TextStyle(color: Colors.green),),
                              SizedBox(
                                 height: size.height*0.14,
                                 width: size.width,
                                child: Text(overview,maxLines: 5,overflow: TextOverflow.ellipsis,style:const TextStyle(color: colorTextwhite),))
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        //   Positioned(
        //     bottom: 80,
        //     left: 20,
        //    // top: 10,
        //     child:Text(texttitle,style:const TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),)
        // ),
        // ],
      // ),
    );
  }
}
