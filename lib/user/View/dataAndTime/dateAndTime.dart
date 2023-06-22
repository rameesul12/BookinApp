import 'package:bookingapp/user/core/constant/constanwidgets.dart';


import 'package:flutter/material.dart';



class DateandTimepage extends StatelessWidget {
  const DateandTimepage({super.key, required this.filimTitile});
final String filimTitile;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: [
          AppBarcontainer(
            leadingPath:'assets/images/left-arrow.png',
            title: 'Starwars',),
//        
//        DateTimePicker(
//   type: DateTimePickerType.dateTimeSeparate,
//   dateMask: 'd MMM, yyyy',
//   initialValue: DateTime.now().toString(),
//   firstDate: DateTime(2000),
//   lastDate: DateTime(2100),
//   icon: Icon(Icons.event),
//   dateLabelText: 'Date',
//   timeLabelText: "Hour",
//   fieldLabelText: '',style: TextStyle(color: textwhite),
//   selectableDayPredicate: (date) {
//     // Disable weekend days to select from the calendar
//     if (date.weekday == 6 || date.weekday == 7) {
//       return false;
//     }

//     return true;
//   },
//   onChanged: (val) => print(val),
//   validator: (val) {
//     print(val);
//     return null;
//   },
//   onSaved: (val) => print(val),
// )
// DateTimePicker(
//   firstDate: 20,
// ),
SizedBox(
 child: Row(
  children: [

  ],
 ),
),
    
       ],
      ),
    );
  }
}