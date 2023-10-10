import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../../variables/colors.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back,color: textwhite,)),
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text("Help And Support"),
      ),
      backgroundColor:backgroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('Help & Support',style: TextStyle(color: textwhite,fontSize: 18,fontWeight: FontWeight.w600),),
          sizedH30,
           Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                """     


Welcome to the Help & Support page of BookMyTickets. We're here to make your cinema ticket booking experience as seamless as possible. If you have any questions, concerns, or need assistance with our app, you've come to the right place.

Getting Started

If you're new to BookMyTickets, check out our Getting Started section for step-by-step guidance on:

Creating an account
Booking movie tickets
Managing your reservations
Exploring app features
FAQs (Frequently Asked Questions)

Browse through our frequently asked questions to find answers to common queries. You'll find information on topics such as:

Account management
Payment methods
Booking procedures
Refund policies
Contact Us

If you can't find the answer you're looking for in our FAQs, our dedicated support team is ready to assist you. You can reach us through the following channels:

Email Support: Send us an email at  rameezulazhar@gmail.com. We aim to respond to your inquiry within 24hour during business hours.

Live Chat: Chat with one of our support agents in real-time by clicking on the Live Chat button in the app. We're available to assist you during business hours.

Report a Problem

Encountering a technical issue, bug, or a problem with your booking? Please let us know by using our Report a Problem feature within the app. This helps us quickly identify and resolve any issues you may face.

Feedback and Suggestions

We value your feedback and welcome your suggestions for improving our app. Share your thoughts and ideas with us to help us enhance your cinema ticket booking experience.
              
                """,
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    color: textwhite,
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}