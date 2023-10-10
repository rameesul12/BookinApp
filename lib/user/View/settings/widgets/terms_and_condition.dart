import 'package:flutter/material.dart';

import '../../../variables/colors.dart';
import '../../../variables/sizedbox.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){  
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back,color: textwhite)),
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text("Help And Support"),
        ),
      body: const SafeArea(child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
           Text('Terms And Condition',style: TextStyle(color: textwhite,fontSize: 18,fontWeight: FontWeight.w600),),
           sizedH30,
       
        Text('''
      For detailed information about your rights and responsibilities when using BookMyTickets, please review our Terms and Conditions.
      
      Thank you for choosing BookMyTickets for your cinema ticket booking needs. We're dedicated to providing you with the best possible service, and your satisfaction is our top priority.
      
      If you need assistance, don't hesitate to reach out to our support team. We're here to help you enjoy a fantastic movie-going experience! ''',  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    color: textwhite,
              ),)
          ],
         
        ),
      ),

      )
      );
    
  }
}