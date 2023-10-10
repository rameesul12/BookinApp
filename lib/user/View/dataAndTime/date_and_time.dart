// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/bookin_page/booking_page.dart';
import 'package:bookingapp/user/View/dataAndTime/widgets/theatre_widgets.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/theatre_showing/theatre_showing_controller.dart';

class DateandTimepage extends StatelessWidget {
  const DateandTimepage({super.key, required this.filimTitile});
  final String filimTitile;
  @override
  Widget build(BuildContext context) {
 // final provider= Provider.of<TheatreShowingController>(context,listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Consumer<TheatreShowingController>(
            builder: (context,value,child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedH10,
                  Row(
                    children: [
                      
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon:const Icon(Icons.arrow_back,color: textwhite,))
                  ,  sizedW10,
              Text(filimTitile, style:const TextStyle(color: textwhite),)
                    ],
                  ),
                    // const Text(
                    //   'Today',
                    //   style: TextStyle(color: textwhite, fontSize: 30),
                    // ),
                    
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
                    
                          value.theatreList.isNotEmpty?  Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: size.height*0.6,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => sizedH10,
                          itemCount: value.theatreList.length,
                          itemBuilder: (context, index) {
                            return  InkWell(
                              onTap: () async{
                                lottieshowing(context);
                              //  log(provider.theatreSeats!.data.screen.totalSeats.toString());
                                await Provider.of<TheatreShowingController>(context,listen: false).seatingCountForBookingPage(index);
                                 Provider.of<TheatreShowingController>(context,listen: false).ticketCount.clear();
                                 Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(movieName: filimTitile,),));
                              },
                              child: TheatreWidget(size: size, place: value.theatreList[index].location, theatreName: value.theatreList[index].ownerName, showTime: value.theatreList[index].showTime, ));
                          },
                        ),
                      )
                      ):Column(
                        children: [
                          SizedBox(height: size.height*0.25,),
              Center(child: Lottie.asset('assets/animation/animation_ll0s7qfl.json',reverse: true,height: size.height*0.2,width: size.width*0.3)),

                          const Center(child: Text("Theatre Not available",style: TextStyle(color: textwhite),),),
                        ],
                      )
                      
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
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
