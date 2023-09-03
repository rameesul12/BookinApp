import 'package:flutter/material.dart';

import '../../../variables/colors.dart';

class CastView extends StatelessWidget {
  const CastView({
    super.key,
    required this.size, required this.imagePath, required this.name, required this.originalName,
    
  });
  final String imagePath;
  final String name;
  final String originalName;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
   //  width: size.width,
   //  height: size.height*0.6,
     decoration:const BoxDecoration(
      // color: textwhite
     ),
     child: Column(
   //   mainAxisAlignment: ma,
       children: [
         CircleAvatar(
          radius: 40,
         backgroundColor: Colors.black,
           child: CircleAvatar(
               radius: 40,
                backgroundImage: NetworkImage("https://www.themoviedb.org/t/p/w300_and_h450_bestv2$imagePath"),
                 ),
         ),
         SizedBox(
          width: size.width*0.2,
          child: Text(name, overflow: TextOverflow.ellipsis,style: const TextStyle(color: textwhite,fontSize: 10),)),
         Text(originalName)
       ],
     ),
    );
  }
}