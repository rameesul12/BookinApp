import 'package:bookingapp/user/View/voucher_screen/widgets/voucher_shimmer_widget.dart';
import 'package:bookingapp/user/View/voucher_screen/widgets/voucher_widgets.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../../controller/theatre_showing/theatre_showing_controller.dart';




class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<TheatreShowingController>(context,listen: false);
    return  Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        backgroundColor: backgroundColor,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back,color: textwhite,)),
        title:const Text('Vouchers',style: TextStyle(color: textwhite),),
        ) ,
       
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
          StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('VoucherCollection').snapshots() ,
              builder:(context, snapshot) {
                if (snapshot.connectionState==ConnectionState.none) {
                  return const Center(child: Text("No voucher are Added"),);
                }else if(snapshot.connectionState==ConnectionState.waiting){
                  return const VoucherShimmerWidget();
                }else{
                  provider.voucherGetting(snapshot);
                  return   Consumer<TheatreShowingController>(
                    builder: (context,data,child) {
                      return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => sizedH10,
                itemBuilder: (context, index) {
                      return data.voucherList[index].selectedOption=='Fixed Amount' ?  VoucherContainer(
                        voucherDesription: data.voucherList[index].couponDescrtion,
                       voucherExpire: data.voucherList[index].couponExpire.toString(),
                        voucherCode: data.voucherList[index].couponCode, 
                        minimumAmount: data.voucherList[index].minimumAmount!,
                       discountAmount: data.voucherList[index].discountAmount.toString(), index: index,
                       ):VoucherContainer(
                        voucherDesription: data.voucherList[index].couponDescrtion,
                       voucherExpire: data.voucherList[index].couponExpire.toString(),
                        voucherCode: data.voucherList[index].couponCode, 
                        percentageMinimumAmount: data.voucherList[index].percentageMinimumAmount,
                       discountPercentage: data.voucherList[index].discountPercentage,
                        index: index,
                      
                       );
                },
                itemCount: data.voucherList.length,
                ),
            );
                    }
                  );
                }
              }, ),
          ],
        ),
      ) ,
    );
  }
}
