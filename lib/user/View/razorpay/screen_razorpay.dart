import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayScreen extends StatefulWidget {
  const RazorpayScreen({super.key});

  @override
  State<RazorpayScreen> createState() => _RazorpayScreenState();
}

class _RazorpayScreenState extends State<RazorpayScreen> {


var razorpay=Razorpay();

  @override
 
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }


  _handlePaymentSuccess(PaymentSuccessResponse response) {
 

  }

   void _handlePaymentError(PaymentFailureResponse response) {  
    log('failed');
   }

  void _handleExternalWallet(ExternalWalletResponse response) {}
    @override
  Widget build(BuildContext context) {
    return const SizedBox(
      
      
    );
  }
  @override
  void dispose() {
razorpay.clear();
    super.dispose();
  }
}