
import 'package:flutter/material.dart';

import '../../../variables/colors.dart';
import '../../../variables/sizedbox.dart';

class TheatreWidget extends StatelessWidget {
  const TheatreWidget({
    super.key,
    required this.size, required this.theatreName, required this.place, required this.showTime
  });

  final Size size;
  final String theatreName;
  final String place;
  final String showTime;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      height: size.height * 0.2,
      decoration:const BoxDecoration(color: textFieldBackground),
      child: 
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    SizedBox(
                      width: size.width*0.7,
                      child: Text(
                        theatreName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(color: textwhite, fontSize: 23),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width,
                  child: Text(
                    place,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:const TextStyle(color: textwhite, fontSize: 15),
                  ),
                ),
             const   Text(
                  'cancellation available',
                  style: TextStyle(color: colorTextwhite),
                ),
                Container(
                      height: size.height * 0.05,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue)),
                          child: Center(child: Text(showTime,style:const TextStyle(color: textwhite))),
                    ),
              ],
            ),
          ),
       
    );
  }
}
