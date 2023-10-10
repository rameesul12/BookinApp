import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../../variables/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back,color: textwhite)),
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text("Privacy Policy",style: TextStyle(color: textwhite,fontSize: 14),),
      ),
      backgroundColor:backgroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            sizedH10,
            Text('Privacy Policy for BookMyTickets',style: TextStyle(color: textwhite,fontSize: 18,fontWeight: FontWeight.w600),),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                """     


At BookMyTickets, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our cinema ticket booking app.

Information We Collect

User Account Information: When you create an account, we collect your name, email address, and password to provide you with personalized services and secure access.

Booking Information: We collect information about your movie preferences, including movie selections, showtimes, and seat choices, to facilitate ticket reservations and enhance your movie-going experience.

Payment Details: To process payments, we may collect payment card details or other payment information. Rest assured, we utilize secure encryption and adhere to strict industry standards to protect your financial information.

Location Information: We may collect your location data to provide you with movie recommendations and showtimes relevant to your area. You can control the app's access to your location through your device settings.

How We Use Your Information

Ticket Booking: We use your information to process your cinema ticket reservations, including sending booking confirmations and providing you with digital tickets.

Personalization: We use your preferences and past bookings to recommend movies, showtimes, and nearby theaters tailored to your interests.

Communication: We may send you important updates, offers, and promotions related to our services. You can opt-out of these communications at any time.

Analytics: We analyze user data to improve our app's functionality, user experience, and content relevance.

Data Security

Your privacy and data security are our top priorities. We implement strict security measures to protect your information from unauthorized access, disclosure, alteration, or destruction.

Third-Party Partners

We may collaborate with third-party partners, such as payment processors and advertising networks. Please note that their use of your information is subject to their respective privacy policies.

Your Choices

You have the right to:

Access, correct, or delete your personal information.
Opt-out of marketing communications.
Disable location services within the app.
Children's Privacy

Our app is intended for users aged 13 and above. We do not knowingly collect personal information from children under 13. If you believe a child has provided us with their information, please contact us to have it removed.

Changes to this Privacy Policy

We may update this Privacy Policy to reflect changes in our practices or legal requirements. We will notify you of any significant updates.

Contact Us

If you have any questions, concerns, or requests regarding your privacy or this Privacy Policy, please contact us at 7012356002.

By using BookMyTickets, you agree to the terms outlined in this Privacy Policy. Your continued use of the app after any changes to this policy will signify your acceptance of those changes.



This is a generic template, and it's important to tailor it to your specific app and adhere to any local privacy regulations. Legal counsel should review and finalize your privacy policy to ensure it meets all legal requirements.
Contact Us
If you have any questions about this Privacy Policy, You can contact us:
      Email: rameezulazhar@gmail.com
              
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