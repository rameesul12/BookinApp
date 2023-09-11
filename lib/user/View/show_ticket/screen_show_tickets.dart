
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../controller/movie_pages_provider/home_page_providerr.dart';
import '../../controller/theatre_showing/theatre_showing_controller.dart';

class SchowTicketsScreen extends StatelessWidget {
  const SchowTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(onPressed: (){}, icon:const Icon( Icons.arrow_back,color: textwhite,)),
        title:const Text("ShowTickets",style: TextStyle(color: textwhite),),
      ),
      body:Center(
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
              child: Column(
                children: [
                  sizedH10,
                  SizedBox(
                  height: size.height*0.2,
                  width: size.width,
                 // color: textBlack,
                  child: Row(
                    children: [
                      Consumer<MoviesProvider>(
                        builder: (context,data,child) {
                          return Container(
                            padding:const EdgeInsets.all(10),
                            height: size.height*0.3,
                            width: size.width*0.5,
                           // color:buttonColor,
                           child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              sizedH10,
                              Expanded(child: Text(data.movieDetails[0].originalTitle,overflow: TextOverflow.ellipsis,style:const TextStyle(color: textBlack,fontSize: 17,fontWeight: FontWeight.bold),)),
                              Consumer<TheatreShowingController>(
                                builder: (context,value,child) {
                                  return Expanded(child: Text(value.theatreData!.location.substring(0).toUpperCase(),overflow: TextOverflow.ellipsis,style:const TextStyle(color: textBlack,fontSize: 14,),));
                                }
                              )


                            ],
                           ),
                          );
                        }
                      ),
                       SizedBox(
                        height: size.height*0.15,
                        width: size.width*0.23,
                       //
                        child: Consumer<MoviesProvider>(
                          builder: (context,image,child) {
                            return SizedBox(                    
                              child: Image.network(
                                "https://www.themoviedb.org/t/p/w300_and_h450_bestv2${image.movieDetails[0].posterPath}",
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
                            );
                          }
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
                            return containerText(firstText: 'Seat', secondText: value.ticketCount.sublist(0).toString());
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
              ),
            ),
          ),
        ),
      )
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