import 'package:bookingapp/user/core/constant/constanwidgets.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';

import 'package:flutter/material.dart';

class DateandTimepage extends StatelessWidget {
  const DateandTimepage({super.key, required this.filimTitile});
  final String filimTitile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarcontainer(
            leadingPath: 'assets/images/left-arrow.png',
            title: 'Starwars',
          ),
          Text(
            'Today',
            style: TextStyle(color: textwhite, fontSize: 30),
          ),
          Flexible(
            child: SizedBox(
              height: size.height * 0.16,
              child: Row(
                children: [
                  DateContainer(
                    month: 'mar',
                    date: '19',
                    day: 'sun',
                  ),
                  sizedW10,
                  DateContainer(
                    month: 'mar',
                    date: '19',
                    day: 'sun',
                  ),
                  sizedW10,
                  DateContainer(
                    month: 'mar',
                    date: '19',
                    day: 'sun',
                  ),
                  sizedW10,
                  DateContainer(
                    month: 'mar',
                    date: '19',
                    day: 'sun',
                  ),
                  sizedW10,
                ],
              ),
            ),
          ),
          sizedH20,

          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: size.width * 0.85,
                height: size.height * 0.2,
                decoration: BoxDecoration(color: textFieldBackground),
                child: Row(
                  children: [
                    sizedW20,
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedH10,
                        Text(
                          'Magic frame Anuragha',
                          maxLines: 1,
                          style: TextStyle(color: textwhite, fontSize: 18),
                        ),
                        Text(
                          'cinema Tirur',
                          maxLines: 1,
                          style: TextStyle(color: textwhite, fontSize: 15),
                        ),
                        Text(
                          'cansellation available',
                          style: TextStyle(color: colorTextwhite),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                                  child: Center(child: Text('11:15',style: TextStyle(color: textwhite))),
                            ),
                           sizedW10,
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                                    child: Center(child: Text('03:15',style: TextStyle(color: textwhite))),
                            ),
                            sizedW10,
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                                    child: Center(child: Text('6:15',style: TextStyle(color: textwhite))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )

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
        ],
      ),
    );
  }
}

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
            style: TextStyle(
                color: textwhite, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Text(
            date,
            style: TextStyle(
              color: textwhite,
            ),
          ),
          Text(
            day,
            style: TextStyle(
                color: textwhite, fontSize: 17, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}