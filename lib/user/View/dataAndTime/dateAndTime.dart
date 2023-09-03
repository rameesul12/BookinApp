import 'dart:developer';

import 'package:bookingapp/user/View/bookinPage/bookingPage.dart';
import 'package:bookingapp/user/core/constant/constanwidgets.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/theatre_showing/theatre_showing_controller.dart';

class DateandTimepage extends StatelessWidget {
  const DateandTimepage({super.key, required this.filimTitile});
  final String filimTitile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Consumer<TheatreShowingController>(
            builder: (context,value,child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarcontainer(
                    leadingPath: 'assets/images/left-arrow.png',
                    title:filimTitile,
                  ),
                  const Text(
                    'Today',
                    style: TextStyle(color: textwhite, fontSize: 30),
                  ),
                  
                  Consumer<TheatreShowingController>(
                    builder: (context,datepicker,child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width*0.59,
                          height: size.height*0.13,
                          decoration: BoxDecoration(
                            color:textFieldBackground,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: DatePicker(
                           DateTime.now(), // Start date
                          initialSelectedDate:datepicker.selectedDate,
                          selectionColor: Colors.blue,
                          dayTextStyle:const TextStyle(color: textwhite),
                          dateTextStyle: const TextStyle(color: textwhite),
                          monthTextStyle: const TextStyle(color: textwhite),
                          selectedTextColor: Colors.white,
                          
                          onDateChange: (date) async{
                            log(date.toString());
                            datepicker.updateSelectedDate(date);
                           await datepicker.allTheatreGetting(context);
                            
                           
                          },
                          daysCount: 3, // Display 3 days
                        ),
                        ),
                      );
                    }
                  ),
                
                //  sizedH20,
                  
            value.theatreList.isNotEmpty?      Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: size.height*0.6,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => sizedH10,
                        itemCount: value.theatreList.length,
                        itemBuilder: (context, index) {
                          return  InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>const BookingPage(),));
                            },
                            child: TheatreWidget(size: size, place: value.theatreList[index].location, theatreName: value.theatreList[index].movieName, showTime: value.theatreList[index].showTime, ));
                        },
                      ),
                    )
                    ):const Center(child: Text("Theatre Not available",style: TextStyle(color: textwhite),),)
                    
                      // : TheatreWidget(size: size, place: '', theatreName: '', showTime: '',)),
                           
                  
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
              );
            }
          ),
        ),
      ),
    );
  }
}

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
                        style: TextStyle(color: textwhite, fontSize: 23),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width*0.4,
                  child: Text(
                    place,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: textwhite, fontSize: 15),
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