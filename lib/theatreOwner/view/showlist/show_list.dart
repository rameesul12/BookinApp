// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/view/showlist/show_list_add.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/add_Shows/add_show_provider.dart';

class ShowListPage extends StatelessWidget {
 const ShowListPage({super.key});

  @override
  Widget build(BuildContext context) {
        final provider=Provider.of<AddShowProvider>(context,listen: false);

    return Scaffold(
      body: Column(
            children: [
              sizedH60,
            const  Text('shows',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold,fontSize: 30,),),
         //  if (data.shows.isEmpty) const Expanded(child: Center(child: Text("there Is No show Added",style: TextStyle(color: textwhite),),)) else 
          
          
           Consumer<AddShowProvider>(
             builder: (context,data,child) {
               return Expanded(
                   child: ListView.separated(
                     itemCount: data.shows.length,
                     separatorBuilder: (context, index) => const Divider(color: textFieldBackground),
                     itemBuilder:(context, index) {
                     return ShowListDisplaying(index: index,);
                   }, ),
                 );
             }
           ),
   ElevatedButton(
                        onPressed: (){
                         log(provider.shows.toString());
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ShowListAdding(editShow: false,)));
                      
                       
                      },style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        )
                      ),
                      
                       child:const Text('Add Screen')),
            ],
           
          )
       ,
    );
  }
}

class ShowListDisplaying extends StatelessWidget {
   const ShowListDisplaying({
    super.key,
    required this.index
  });
 final int index;
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AddShowProvider>(context,listen: false);
    final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:  Consumer<AddShowProvider>(
        builder: (context,showData,child) {
          return Container(
                 height: size.height*0.4,
                 width: size.width*0.4,
                 decoration: BoxDecoration(
                  
                  color:textFieldBackground,
                  borderRadius:BorderRadius.circular(10)
                  
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     //sizedW20,
                      sizedH10,
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const  Text("Screen Number :",style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold,fontSize: 18),),
                          sizedW20,
                               Text("${showData.shows[index].screen}",style:const TextStyle(color: colorTextwhite),),
                        ],
                      ),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const   Text("MovieName :",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold,fontSize: 18),),
                          sizedW20,
                              Expanded(child: Text(showData.shows[index].movieName!,style: const TextStyle(color: colorTextwhite),)),
                        ],
                      ),
                      
                        Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                         const   Text("Show Time :",style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold,fontSize: 18),),
                          sizedW20,
                           Expanded(child:    Text(showData.shows[index].showTime!,style: const TextStyle(color: colorTextwhite),)),
                        ],
                      ),
                         Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        const   Text("Start Date :",style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold,fontSize: 18),),
                          sizedW20,
                           Expanded(child:    Text("${showData.shows[index].startDate}".substring(0,10),style:const TextStyle(color: colorTextwhite),)),
                        ],
                      ),
                        Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           const   Text("End Date :",style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold,fontSize: 18),),
                          sizedW20,
                           Expanded(child:    Text("${showData.shows[index].endDate}".substring(0,10),style:const TextStyle(color: colorTextwhite),)),
                        ],
                      ),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           const   Text("Price :",style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold,fontSize: 18),),
                          sizedW20,
                           Expanded(child:    Text("${showData.shows[index].price}",style:const TextStyle(color: colorTextwhite),)),
                        ],
                      ),
                     
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                             
                              children: [
                               // sizedW10,
                                SizedBox(
                                  height: size.height*0.047,
                                  width: size.width*0.328,
                                  child: ElevatedButton(
                                      onPressed: ()async{
                                       // log("ok");
                                        lottieshowing(context);
                                    await provider.showDeleting(context,index);
                                     Navigator.pop(context);
                                    
                                    },style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)
                                      )
                                    ),
                                    
                                     child:const Text('Delete',style: TextStyle(fontSize: 14,color: textwhite),)),
                                ),
                                sizedW40,
                                  SizedBox(
                              height: size.height*0.047,
                              width: size.width*0.328,
                              child: ElevatedButton(
                                  onPressed: (){
                                  //  log(provider.editShowbool.toString());
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => ShowListAdding(index: index,editShow: true,)));
                                 provider.values(index);
                                
                                },style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                  )
                                ),
                                
                                 child:const Text('Edit',style: TextStyle(fontSize: 14,color: textwhite),)),
                            ),
                              ],
                            ),
                       
                      sizedW20,
                    
                     
                          //  Align(
                            //   alignment: Alignment.centerRight,
                            //   child: SizedBox(
                            //     height: size.height*0.04,
                            //     width: size.width*0.328,
                            //     child: ElevatedButton(
                            //         onPressed: (){
                            //         Navigator.push(context,MaterialPageRoute(builder: (context) => ShowListAdding()));
                                  
                            //       },style: ElevatedButton.styleFrom(
                            //         backgroundColor: Colors.red,
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(3)
                            //         )
                            //       ),
                                  
                            //        child:const Text('AddScreen',style: TextStyle(fontSize: 14,color: textwhite),)),
                            //   ),
                            // )
                        ],
                      ),
                 )
                  
                 );
        }
      )
    );
        }
   

  }
