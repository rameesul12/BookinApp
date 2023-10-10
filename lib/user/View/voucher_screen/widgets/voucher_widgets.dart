import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/controller/theatre_showing/theatre_showing_controller.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../../../variables/colors.dart';



class VoucherContainer extends StatelessWidget {
  const VoucherContainer({
    super.key, required this.voucherDesription, required this.voucherCode, required this.voucherExpire,  this.discountAmount, this.minimumAmount,
    required this.index,this.percentageMinimumAmount,this.discountPercentage
  });
  final String voucherDesription;
  final String voucherCode;
  final String voucherExpire;
  final String? discountAmount;
  final int? minimumAmount;
  final int? percentageMinimumAmount;
  final int index;
  final int? discountPercentage;
   

  


  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<TheatreShowingController>(context,listen: false);
    final Size size = MediaQuery.of(context).size;
    
    return Stack(
      children: [
        Neumorphic(
            padding: const EdgeInsets.all(10),
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 2,
              lightSource: LightSource.topLeft,
              color: textFieldBackground,
            ),
            child: SizedBox(
              height: size.height * 0.1,
              width: size.width,
            
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        AssetImage('assets/images/icons8-sale-tags-53.png'),
                  ),
                  sizedW10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.7,
                        child: Consumer<TheatreShowingController>(
                          builder: (context,data,child) {
                            return RichText(
                              overflow: TextOverflow.ellipsis,
                              text:  TextSpan(children: [
                                TextSpan(
                                    text: voucherDesription,
                                    style:const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              data.voucherList[index].selectedOption=='Fixed Amount'?  TextSpan(
                                    text: '$discountAmount₹',
                                    style: const TextStyle(
                                        color: textwhite,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)):TextSpan(
                                    text: '$discountPercentage%',
                                    style: const TextStyle(
                                        color: textwhite,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                               const  TextSpan(
                                    text: ' Discount',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ]),
                            );
                          }
                        ),
                      ),
                      Text('Coupon Code:$voucherCode',
                          style:const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          )),
                      Consumer<TheatreShowingController>(
                        builder: (context,data,child) {
                          return data.voucherList[index].selectedOption=='Fixed Amount' ?Text('Minimum amount to apply $minimumAmount₹',
                              style:const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              )):Text('Minimum amount to apply $percentageMinimumAmount₹',
                              style:const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ));
                        }
                      ),
                      Text('Valid Till:$voucherExpire',
                          style:const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          )),
                    ],
                  ),
                 
                ],
              ),
            )),
             Positioned(
              right: 5,
              bottom: 0,
              
              child: Consumer<TheatreShowingController>(
                builder: (context,value,child) {
                  return SizedBox(
                        width: size.width*0.23,
                        height: size.height*0.04,
                        child: ElevatedButton(
                          
                          onPressed: () {
                          //  log(percentageMinimumAmount.toString());
                            
                            // log(value.tottalPrice.toString());
                            if (value.voucherList[index].selectedOption=='Fixed Amount') {
                              
                            if (minimumAmount! > value.tottalPrice ) {
                              getError("for this voucher Applying minimum ${value.voucherList[index].minimumAmount} purchase needed", context);
                            }else{
                                 Provider.of<TheatreShowingController>(context,listen: false).voucherApplyingFixedAmount(index);
                              Navigator.pop(context);
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("${value.voucherList[index].couponDescrtion} Applied")));
                            }
                            }else{
                               if(percentageMinimumAmount! > value.tottalPrice) {
                              log('ok');
                                  getError("for this voucher Applying minimum ${value.voucherList[index].percentageMinimumAmount} purchase needed", context);
                               }else{
                                   Provider.of<TheatreShowingController>(context,listen: false).voucherApplyingPercentage(index);
                              Navigator.pop(context);
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("${value.voucherList[index].couponDescrtion} Applied")));
                               }
                            
                            }
                          
                                    
                               
                          }, 
                        style: ElevatedButton.styleFrom(
                          padding:const EdgeInsets.all(0),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        )
                        ,
                        
                        child: const Text('Apply',style: TextStyle(color: textwhite,fontSize: 10),)),
                      );
                }
              ),
            )
      ],
    );
  }
}
