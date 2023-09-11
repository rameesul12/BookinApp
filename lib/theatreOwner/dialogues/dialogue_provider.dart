import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';

import '../model/booking_Status/booking_details.dart';


 class ShowDialogues{
    
static bookingData({required BuildContext context,required BookingDetails data,int? index}){
  showDialog(context: context, builder: (context) {
    return SimpleDialog(
      backgroundColor: textFieldBackground,
      title: const Text("Booking Details",style: TextStyle(color: textwhite),),
      children: [
   const Text("===============================",style: TextStyle(color: Colors.white60),),
    sizedH20,
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                 Text("Screen:",style: TextStyle(color: colorTextwhite),),
                Text("Languege:",style: TextStyle(color: colorTextwhite),),
                Text("Seats :",style: TextStyle(color: colorTextwhite),),
                Text("Date :",style: TextStyle(color: colorTextwhite),),
                Text("Show Time :",style: TextStyle(color: colorTextwhite),),
                Text("Booking Id :",style: TextStyle(color: colorTextwhite),),
                Text("Sub Total :",style: TextStyle(color: colorTextwhite),),
                Text("Convenience fees :",style: TextStyle(color: colorTextwhite),),
                sizedH10,
                Text("Total:",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                ]),
              //  column
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
               Text("${data.screen}",overflow:TextOverflow.ellipsis,style:const TextStyle(color: colorTextwhite),),
                 Text("${data.language} :",overflow: TextOverflow.ellipsis,style:const TextStyle(color: colorTextwhite),),
                 Text(data.selectedSeats[0].id,overflow: TextOverflow.ellipsis,style:const TextStyle(color: colorTextwhite),),
                 Text("${data.date} :".substring(0,10),style:const TextStyle(color: colorTextwhite),),
                 Text("${data.showTime} :",style:const TextStyle(color: colorTextwhite),),
                 Text("${data.bookingId} :",style:const TextStyle(color: colorTextwhite),),
                 Text("${data.subtotal }:",style:const TextStyle(color: colorTextwhite),),
                 Text("${data.fee}:",style:const TextStyle(color: colorTextwhite),),
                sizedH10,
                 Text("${data.total}",style:const TextStyle(color: textwhite,fontWeight: FontWeight.bold),),

               
           
              ],
             ),
             
            ],
          ),
         
              Center(child: ElevatedButton(onPressed: (){Navigator.pop(context);},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))) 
              , child:const Text("Ok")))
         
        ],
      ),
    )
     
    
      ],
    );
  },);
}
//  screenShowing(BuildContext context,TextEditingController controller){

// showDialog(context:context , builder: (context) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: SizedBox(
//       child: SimpleDialog(
//         backgroundColor:textFieldBackground,
//       title:const Text('Add Screens',style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold),),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//       children: [
//         TextFormField(
//           controller:controller ,
//            textAlign: TextAlign.left,
//            // keyboardType:input ,
//             style:const  TextStyle(fontSize: 11,color: textwhite),
           
//             decoration: InputDecoration(
//               // filled: true,
//               // fillColor: ,
//               // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
//             // icon: Icon(textIcon,color: Colors.white,),
//              //prefixIcon:Icon(textIcon,color: Colors.white,),
//               hintText: "Screen number",hintStyle:const TextStyle(color: Colors.grey),
//               border:
//               OutlineInputBorder(    
//                 borderRadius:
//                  BorderRadius.circular(13),
//               )
            
//         )
//         ),
//         TextButton(onPressed: (){
          
//           if (screenAdding(controller.text)) {
//             getError("please fill the screen ", context);
//           }else{
//           final screenName = ListDetails(screenName: controller.text);
//             screenManagingList.add(screenName);
//           }
        
//           //screenManagingList.clear();
          
//           notifyListeners();
//         }, child:const Text('Add Screen')),
//         TextButton(onPressed: (){
//           Navigator.pop(context);
//         }, child: const Text("cancel"))
//       ],
//       ),
//     ),
//   );
// }
//   );
//   }


 }