
import 'package:flutter/material.dart';

import '../../../variables/colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    super.key,
    required this.month,
    required this.date,
    required this.day,
   });
  final String month;
  final String date;
  final String day;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1,
      width: size.width * 0.22,
      decoration: BoxDecoration(
          color: textFieldBackground,
          border: Border.all(color: textwhite.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            month,
            style:const TextStyle(
                color: textwhite, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Text(
            date,
            style:const TextStyle(
              color: textwhite,
            ),
          ),
          Text(
            day,
            style:const TextStyle(
                color: textwhite, fontSize: 17, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}