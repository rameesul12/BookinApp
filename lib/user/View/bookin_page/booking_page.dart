// ignore_for_file: unrelated_type_equality_checks


import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../controller/razor_pay/razor_pay_controller.dart';
import '../../controller/theatre_showing/theatre_showing_controller.dart';
import '../show_ticket/screen_show_tickets.dart';
import '../voucher_screen/voucher_screen.dart';



class BookingPage extends StatefulWidget {
  const BookingPage({Key? key, this.movieName}) : super(key: key);

  final String? movieName;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var razorpay = Razorpay();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TheatreShowingController>(context);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
              width: size.width,
              //    color: textwhite,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: textwhite,
                      )),
                  sizedW10,
                  SizedBox(
                      width: size.width * 0.7,
                      child: Center(
                          child: Text(
                        widget.movieName!,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )
                      )
                      )
                ],
              ),
            ),
            sizedH10,
            Container(
              width: size.width * 0.7,
              height: size.height * 0.04,
              // color: textwhite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //  color: textwhite,
                  boxShadow: const [BoxShadow(blurRadius: 25.0, color: textwhite)]),
              child: Container(
                decoration: BoxDecoration(
                    color: textwhite, borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Screen",
                    style: TextStyle(
                        color: textBlack, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            sizedH30,
            Consumer<TheatreShowingController>(builder: (context, data, child) {
              return data.theatreSeats!.data.screen.columns < 10
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      height: size.height * 0.55,
                      width: size.width * 0.9,
                      color: backgroundColor,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: data.theatreSeats!.data.screen.totalSeats,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                data.theatreSeats!.data.screen.columns,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          int countrows =
                              data.theatreSeats!.data.screen.columns;

                          return InkWell(
                            onTap: () {
                              final value =
                                  "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}";

                              provider.seatListChangeValue(index);
                              provider.ticketsCounts(value);
                            },
                            child: Container(
                              height: size.height * 0.02,
                              width: size.width * 0.02,
                              decoration: BoxDecoration(
                                  color: data.theatreSeatsList[index] == true
                                      ? Colors.green
                                      : textwhite,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}",
                                  style: const TextStyle(
                                      color: textBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // child: Center(
                              //       child: Text(

                              //               "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}",

                              //          style:TextStyle(color: textwhite,fontWeight: FontWeight.bold,),)
                              //     ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      height: size.height * 0.55,
                      width: size.width * 0.9,
                      color: backgroundColor,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: data.theatreSeats!.data.screen.totalSeats,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                data.theatreSeats!.data.screen.columns,
                            childAspectRatio: 0.4,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          int countrows =
                              data.theatreSeats!.data.screen.columns;

                          return InkWell(
                            onTap: () {
                              final value =
                                  "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}";
                              data.ticketsCounts(value);
                              data.seatListChangeValue(index);
                            },
                            child: Container(
                              height: size.height * 0.02,
                              width: size.width * 0.02,
                              decoration: BoxDecoration(
                                  color: data.theatreSeatsList[index] == true
                                      ? Colors.green
                                      : textwhite,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}",
                                  style: const TextStyle(
                                      color: textBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // child: Center(
                              //       child: Text(

                              //               "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}",

                              //          style:TextStyle(color: textwhite,fontWeight: FontWeight.bold,),)
                              //     ),
                            ),
                          );
                        },
                      ),
                    );
            }),
            sizedH10,
            Container(
              height: size.height * 0.08,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: textwhite.withOpacity(0.3)),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 0.3,
                      child: ListTile(
                        title: const Text(
                          "Available",
                          style: TextStyle(fontSize: 10, color: textwhite),
                        ),
                        leading: Container(
                          height: size.height * 0.02,
                          width: size.width * 0.05,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: textBlack),
                            color: textwhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: size.height * 0.1,
                        width: size.width * 0.3,
                        child: ListTile(
                          title: const Text(
                            "Sold",
                            style: TextStyle(color: textwhite, fontSize: 12),
                          ),
                          leading: Container(
                            height: size.height * 0.02,
                            width: size.width * 0.05,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: textBlack),
                                color: Colors.yellow),
                          ),
                        )
                        ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: size.height * 0.1,
                        width: size.width * 0.3,
                        child: ListTile(
                          title: const Text("Select",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textwhite,
                                  fontSize: 10)),
                          leading: Container(
                            height: size.height * 0.02,
                            width: size.width * 0.05,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                color: Colors.green),
                          ),
                        )),
                  )
                ],
              ),
            ),
             sizedH10,
             Consumer<TheatreShowingController>(
               builder: (context,buttonValue,child) {
                 return NeumorphicButton(
      onPressed: (){
        
        if (buttonValue.voucherLoaded==false && buttonValue.ticketCount.isNotEmpty) {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>const VoucherScreen(),));
        }else if(buttonValue.ticketCount.isEmpty){
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("please select any seats")));
        } else{
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Voucher Already Added ")));
        }
      },
      style: NeumorphicStyle(
        depth: 2,
        lightSource: LightSource.topLeft,
        color:buttonValue.voucherLoaded ==false? Colors.blue:Colors.grey,
        shape: NeumorphicShape.convex,
      ),
      child:buttonValue.voucherLoaded ==false? const Text('Apply Voucher',style: TextStyle(color: textwhite)): const Text('Voucher Added',style: TextStyle(color: textwhite))
      
    );
              
               }
             )
             
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TheatreShowingController>(
            builder: (context, value, child) {
          return SizedBox(
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: FloatingActionButton(
                backgroundColor: buttonColor,
                onPressed: ()  {
                  if (provider.ticketCount.isNotEmpty) {
                    
                  dynamic options = {
                    'key': 'rzp_test_LS04j2FVS1akZj',
                    'amount': value.tottalPrice * 100,
                    'name': "BuyMyticket",
                    'timeout': 300,
                  };
                  razorpay.open(options);
                  }else{
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("please select any seats")));                  }
          // await Provider.of<RazorPayController>(context,listen: false).razorPayResponse(context);
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => SchowTicketsScreen(),));
                },
                child: Center(
                  child: Text(
                    "Pay Now ₹${value.tottalPrice}",
                    style: const TextStyle(color: textwhite),
                  ),
                ),
              )
              );
        }),
      ),
    );
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) {
     Provider.of<RazorPayController>(context,listen: false).razorPayResponse(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  SchowTicketsScreen(),));
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}
}
