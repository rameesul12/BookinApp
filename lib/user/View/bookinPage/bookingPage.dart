import 'package:bookingapp/user/variables/colors.dart';
import 'package:flutter/material.dart';


class BookingPage extends StatefulWidget {
const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _MyAppState();
}

class _MyAppState extends State<BookingPage> {


  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    
    return  Scaffold(
      body: Column(
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
          height: size.height*2,
         )
           
           
       
        ]
      )  
    );
    }
}
