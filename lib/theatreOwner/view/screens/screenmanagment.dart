// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/theatreOwner/view/screens/screen_adding.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/add_Screen/current_owner_provider.dart';


// ignore: must_be_immutable
class ScreenManagment extends StatelessWidget {
  const ScreenManagment({super.key});

  @override
  Widget build(BuildContext context) {
//  final provider=Provider.of<AddScreenProvider>(context,listen: false);

   
    return Scaffold(
      body: SafeArea(
        child:  SizedBox(
          child: Column(
                children: [
                  sizedH20,
                const  Text('My screens',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold),),
                  sizedH20,
                  Expanded(
                    child: Consumer<AddScreenProvider>(
                      builder: (context,value,child) {
                        return ListView.separated(
                          itemCount:value.screenInfo.length,
                         // itemCount: 5,
                          separatorBuilder: (context, index) => const Divider(color: textFieldBackground),
                          itemBuilder:(context, index) {
                          return ScreenAddingData(index:index, );
                        }, );
                      }
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ScreenAdding()));
                  
                  },style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    )
                  ),
                  
                   child:const Text('Add Screen'))
                ],
              ),
        )
         
      ),
    );
  }
}

// ignore: must_be_immutable
class ScreenAddingData extends StatelessWidget {
  
   bool checkingState=false;
   ScreenAddingData({
    super.key,
    required this.index,
   
  });
  
  int index;
 // List<ListDetails>screen;
  

  @override
  Widget build(BuildContext context) {
 //   final provider=Provider.of<AddScreenProvider>(context,listen: false);
    final Size size=MediaQuery.of(context).size;
    return  Consumer<AddScreenProvider>(
                  builder: (context,data,child) {
                    return Row(

             mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              /*   sizedW30,
                Text("${index+1}",style:const TextStyle(color: textwhite),),
                sizedW20, */
                Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                       
                        height:size.height*0.28,
                        width: size.width*0.6,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70),
                           color: textFieldBackground,
                    
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              sizedH20,
                             
                               Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   sizedW30,
                                  const Icon(Icons.chair_alt_outlined,color: textwhite,),
                                  const Text("Screen Number : ",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                                //Text(" 1",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                                  Text("${data.screenInfo[index].screen}",style:const TextStyle(color: textwhite),),
                               
                                ],
                              ),
                               // sizedH20,
                                 Row(
                                  children: [
                                     sizedW30,
                                     const Icon(Icons.chair,color: textwhite,),
                                const  Text("Total Seats    ",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                                  sizedW10,
                               const   Text(":",style: TextStyle(color: textwhite),),
                                   Text("${data.screenInfo[index].totalSeats}",style:const TextStyle(color: textwhite),),
                                  ],
                                ),
                                Row(
                                children: [
                                   sizedW30,
                                const Icon(Icons.table_rows,color: textwhite,),
                                const Text("Columns",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                                  sizedW20,
                                  const Text(":",style: TextStyle(color: textwhite),),
                                   Text("${data.screenInfo[index].columns}",style:const TextStyle(color: textwhite),),
                                ],
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   sizedW30,
                                    const Icon(Icons.table_rows_outlined,color: textwhite,),
                                const  Text("Rows",style: TextStyle(color: textwhite,fontWeight: FontWeight.bold),),
                                  sizedW20,
                                  const Text(":",style: TextStyle(color: textwhite),),
                                   Text("${data.screenInfo[index].rows}",style:const TextStyle(color: textwhite),),
                                ],
                              ),
                               // sizedH20,
                              
                              //  sizedH20,
                                  sizedH20,
                               Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                          ElevatedButton(
                            onPressed: ()async{
                              lottieshowing(context);
                                           await data.screenDeleting(data
                                           .screenInfo[index].id,index,context);
                                           await data.getScreen(context);
                             Navigator.pop(context);
                            },
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                          
                            )
                           ),child:const Text("delete",style: TextStyle(color: textwhite),),),
                           sizedW10,
                             ElevatedButton(
                            onPressed: (){
                             
                            // List<ScreenDeatails>list=provider.screenInfo;
                             checkingState=true;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenAdding(checking: checkingState),));
                             
                    
                            },
                           style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                           ),child:const Text("Edit",style: TextStyle(color: textwhite),),),
                                      ],
                                    )
                            ],
                          ),
                        ),
                       
                           
                           
                      ),
                    )
             
              ],
            );
                 }
                );
   
      }
    
  }




class ListScreen{
  List<ListDetails>list=[];

  ListScreen({required this.list});
}

class ListDetails{
  String screenName;

  ListDetails({required this.screenName});
}