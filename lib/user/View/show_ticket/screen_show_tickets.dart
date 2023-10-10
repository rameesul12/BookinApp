


// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/show_ticket/widgets/create_pdf.dart';
import 'package:bookingapp/user/View/show_ticket/widgets/shimmer_tickets.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import '../../controller/razor_pay/razor_pay_controller.dart';
import '../../controller/theatre_showing/theatre_showing_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;





class SchowTicketsScreen extends StatefulWidget {
const  SchowTicketsScreen({super.key, });


  @override
  State<SchowTicketsScreen> createState() => _SchowTicketsScreenState();
}

class _SchowTicketsScreenState extends State<SchowTicketsScreen> {
     final ScreenshotController screenshotController = ScreenshotController();
     

Future printDoc( String movieName,String bookingId) async{

  final images=await imageFromAssetBundle('assets/images/filim.jpg');

final doc=pw.Document();
doc.addPage(pw.Page(
  build: (context) {
    return createPdf(images, movieName, bookingId);
  },));
  await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());

}
  

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<RazorPayController>(context,listen: false);
   //  pdfList.addAll([provider.ticketsModal]);
    final Size size=MediaQuery.of(context).size;
    return  Consumer<RazorPayController>(
      builder: (context,value,child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const Icon( Icons.arrow_back,color: textwhite,)),
            title:const Text("ShowTickets",style: TextStyle(color: textwhite),),
          ),
          body: value.isLoaded==true?ShimmerTicketsScreen(size: size):Column(
            children: [                               
              Screenshot(
                controller: screenshotController,
                child: Center(
                  child: Container(
                    height: size.height*0.6,
                    width: size.width*0.8,
                    color: Colors.blue,
                    child: Center(
                      child: Container(
                        height: size.height*0.58,
                        width: size.width*0.76,
                        decoration: BoxDecoration(
                          color: textwhite,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Consumer<RazorPayController>(
                          builder: (context,data,child) {
                            return data.ticketsAvailable==true? Column(
                              children: [
                                sizedH10,
                                SizedBox(
                                height: size.height*0.2,
                                width: size.width,
                               // color: textBlack,
                                child: Row(
                                  children: [
                                    Container(
                                      padding:const EdgeInsets.all(10),
                                      height: size.height*0.3,
                                      width: size.width*0.5,
                                     // color:buttonColor,
                                     child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        sizedH10,
                                        Expanded(child: Text(data.ticketsModal!.data.bookings.movieName,overflow: TextOverflow.ellipsis,style:const TextStyle(color: textBlack,fontSize: 17,fontWeight: FontWeight.bold),)),
                                        Expanded(child: Text(data.ticketsModal!.data.bookings.location.substring(0).toUpperCase(),overflow: TextOverflow.ellipsis,style:const TextStyle(color: textBlack,fontSize: 14,),)),
                                        Text("BookingId:${data.bookingId}",style:const TextStyle(color: textBlack),)
                              
                              
                                      ],
                                     ),
                                    ),
                                     SizedBox(
                                      height: size.height*0.15,
                                      width: size.width*0.23,
                                     //
                                      child: SizedBox(                    
                                        child: Image.network(
                                            data.ticketsModal!.data.bookings.image,
                                          fit: BoxFit.fill,
                                          width: size.width*0.1,
                                          height: size.height*0.11,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress==null) {
                                              return child;
                                            }else{
                                            return const  Center(child: CircularProgressIndicator(),);
                                            }
                                          },
                                          ),
                                      ),
                              
                                    ),
                                  ],
                                ),
                                ),
                                sizedH20,
                              Text("-------- SCAN QRCODE AT CINEMA --------",style: TextStyle(color: Colors.grey.withOpacity(0.3)),)
                                 , sizedH20,
                               Container(
                                padding:const EdgeInsets.all(10),
                                height: size.height*0.28,
                                width: size.width,
                               // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                      Consumer<TheatreShowingController>(
                                        builder: (context,data,child) {
                                          return containerText(firstText: data.selectedDate.toString().substring(0,10), secondText:data.theatreData!.showTime);
                                        }
                                      ),
                                      sizedW10,
                            Consumer<TheatreShowingController>(
                              builder: (context,data,child) {
                                return containerText(firstText: 'Screen', secondText:"screen ${data.theatreData!.screen.toString()}" );
                              }
                            ),
                              
                                    ],),
                                      Row(
                                        
                                        children: [
                                          sizedW20,
                                      Consumer<TheatreShowingController>(
                                        builder: (context,value,child) {
                                          return containerText(firstText:'Seat', secondText: value.ticketCount.sublist(0).toString());
                                        }
                                      ),
                                     
                            
                              
                                    ],),
                                                QrImageView(
                              data: '1234567890',
                              version: QrVersions.auto,
                              size:size.height*0.15,
                              ),
                                  ],
                                ),
                               ),
                              
                               
                              ],
                            ):Container(
                              height: size.height*0.6,
                    width: size.width*0.8,
                    color: textwhite,
                    child:const Center(child: Text("No tickets",style: TextStyle(color:textBlack),),),
                            );
                          }
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              sizedH10,
              Consumer<RazorPayController>(
                builder: (context,value,child) {
                  return value.ticketsAvailable==true?
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       ElevatedButton(onPressed: () async{
                       
                      await  provider.cancelOrderApi();
                      getError("TicketCanceled", context);
                     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const BookingPage(),));
                      //  await createPdfBlob();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
                      ),
                       child:const Text("Cancel Ticket",style: TextStyle(color: textwhite),)),
                      ElevatedButton(onPressed: () async{
                       
                       printDoc( 
                       value.ticketsModal!.data.bookings.movieName,
                        value.bookingId);
    
    
                      
                      //  await createPdfBlob();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                       child:const Text("Download",style: TextStyle(color: textwhite),)),

                    ],
                  ):  ElevatedButton(onPressed: (){
                       
                      
                      //  await createPdfBlob();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                       child:const Text("BookTIckets",style: TextStyle(color: textwhite),));
                }
              )
            ],
          )
        );
      }
    );
  }

  Column containerText({required String firstText,required String secondText}) {
    
    return Column(
    
    crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      Text(firstText,style: TextStyle(color: Colors.grey.withOpacity(0.8)),),
  Text(secondText,style:const TextStyle(color: textBlack,fontWeight: FontWeight.w600),)

     ],
    );
    }
}