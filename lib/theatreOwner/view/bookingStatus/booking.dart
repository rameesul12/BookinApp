

import 'dart:developer';
import 'package:bookingapp/theatreOwner/dialogues/dialogue_provider.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/booking_Status/booking_status.dart';
import '../../model/booking_Status/booking_details.dart';

class BookingStatus extends StatelessWidget {
  const BookingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sizedH60,
       const Text('Booking Status',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
        Consumer<BookingProvider>(
          builder: (context,value,child) {
            return FutureBuilder(
                future: value.getBooking(context),
                builder: (context, snapshot)  {
                  log("${snapshot.data}");
                  if ( snapshot.connectionState==ConnectionState.none) {
                    return const Text("No Booking Details",style: TextStyle(color: textwhite),);
                  }else if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(snapshot.hasData){

             return Expanded(
                child: ListView.separated(
                   separatorBuilder:(context, index) => const Divider(color: textFieldBackground), 
                  
                    itemBuilder: (context, index) {
                      return bookingStatusWidget(listData: snapshot.data![index],);
                     },
                       itemCount: snapshot.data!.length,
                    ),
              );
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                
                  } 
            );
          }
        )
        ],
      ),
    );
  }
}


// ignore: camel_case_types
class bookingStatusWidget extends StatelessWidget {
 
   const bookingStatusWidget({
    super.key,
    required this.listData
  });
 final BookingDetails listData;

  @override
  Widget build(BuildContext context) {
     final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10,),
      child: Container(
       width:size.width*8 ,
       height: size.height*0.2,
       decoration: BoxDecoration(
        color: textFieldBackground ,
       borderRadius: BorderRadius.circular(10),
          ),
          child: 
              
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Text("Booking Id:",style:TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                      
                   SizedBox(child: Text(listData.bookingId,overflow: TextOverflow.ellipsis,maxLines: 1,style:const TextStyle(color: colorTextwhite),))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                const  Text("User Name:",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                   SizedBox(child: Text(listData.userName,overflow: TextOverflow.ellipsis,maxLines: 1,style:const TextStyle(color: colorTextwhite),))
                    ],
                  ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
               const    Text("Movie Name:",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                   SizedBox(child: Text(listData.movieName,overflow: TextOverflow.ellipsis,maxLines: 1,style:const TextStyle(color: colorTextwhite),))
                    ],
                  ),
                ],
              ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   const  Text("Booking Status:",style:TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                      
                   SizedBox(child: Text(listData.status,overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(color: colorTextwhite),))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   const Text("Booking Date	:",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                   SizedBox(child: Text('${listData.date}'.substring(0,10),overflow: TextOverflow.ellipsis,maxLines: 1,style:const TextStyle(color: colorTextwhite),))
                    ],
                  ),
                  
             
                  
                    Row(
                   //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedW40,
                        SizedBox(
                          height: size.height*0.036,
                          width: size.width*0.23,
                        
                          child: ElevatedButton(onPressed: (){
                          ShowDialogues.bookingData( context: context, data:listData, );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                         )
                          )
                          
                          , child:const Text("view",style: TextStyle(color: textwhite),)),
                        ),
                      ],
                    ),
                ],
              ),
            ],)
      )
      );
              }
}
          
       
      //  trailing: Text('+350',style: TextStyle(color: textwhite),),
      
    
  
  
