
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

class BookingStatus extends StatelessWidget {
  const BookingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          sizedH60,
        Text('Booking Status',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
        Expanded(
          child: ListView.separated(
             separatorBuilder:(context, index) => Divider(color: textFieldBackground), 
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text('user ${index+1}',style: TextStyle(color: textwhite),),
                //  trailing: Text('+350',style: TextStyle(color: textwhite),),
                );
               },
              ),
        )
        ],
      ),
    );
  }
}