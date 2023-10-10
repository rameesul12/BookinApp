


import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../variables/colors.dart';
import '../../../variables/sizedbox.dart';

class ShimmerTicketsScreen extends StatelessWidget {
  const ShimmerTicketsScreen({
    super.key,
   required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: size.width,
              height: size.height,
              color:const Color.fromARGB(255, 48, 45, 45),
              child: Shimmer.fromColors(
          baseColor: Colors.black54,
          highlightColor: const Color.fromARGB(255, 112, 111, 103),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                 Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
              height: size.height*0.26,
              width: size.width,
              color: textwhite,
                 ),
                 ),
                 sizedH10,
                 Align(
                alignment: Alignment.centerLeft,
                 child: Container(
              width: size.width*0.4,
              height: size.height*0.04,
              color: textwhite,
                 ),
                 ),
                 sizedH10,
                SizedBox(
                      height: size.height*0.23,
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics:const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) => sizedW10,
                      itemBuilder: (context, index) {
                      return Container(
                   //  height: size.height*0.2,
                      width: size.width*0.4,
                      color: textwhite,
                           );
                        
                      },
                    ),
                  ),
                ],
              ),
                ),
                
                sizedH10,
                 Align(
                alignment: Alignment.centerLeft,
                 child: Container(
              width: size.width*0.4,
                       height: size.height*0.04,
              color: textwhite,
                 ),
                 ),
                sizedH10,
                Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: size.width,
                          height: size.height*0.26,
                          child: ListView.separated(
                            shrinkWrap: true,
                             physics:const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            separatorBuilder: (context, index) => sizedW10,
                            itemBuilder: (context, index) {
                            return Container(
                          //  height: size.height*0.2,
                            width: size.width*0.4,
                            color: textwhite,
                                 );
                              
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                 
                 
                ],
              ),
            ),
          ),
              ),
            ),
        ],
      ),
    );
  }
}
