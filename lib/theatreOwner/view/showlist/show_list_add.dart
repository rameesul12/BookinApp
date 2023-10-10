
// ignore_for_file: use_build_context_synchronously, must_be_immutable, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/dialogues.dart';
import '../../../user/core/textformfield.dart';
import '../../../user/variables/colors.dart';
import '../../../user/variables/sizedbox.dart';
import '../../controller/provider/add_Screen/current_owner_provider.dart';
import '../../controller/provider/add_Shows/add_show_provider.dart';




class ShowListAdding extends StatelessWidget {
   ShowListAdding ({super.key,this.index,this.editShow});
final _formkey=GlobalKey<FormState>();
 bool? editShow=false; 
final int? index;

  @override
  Widget build(BuildContext context) {
   //  String screen='';
    final Size size=MediaQuery.of(context).size;
   final providerScreen=Provider.of<AddScreenProvider>(context,listen: false);
    final provider =Provider.of<AddShowProvider>(context,listen: false);
    return Scaffold(
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key:_formkey,
              child: Consumer<AddShowProvider>(
                builder: (context,data,child) {
                  return Column(
                    children: [
                      sizedH20,
                    //  Text('My screens',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold),),
                      sizedH30,
                     /* Container(
                      width:size.width*0.4 ,
                      height: size.height*0.1,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorTextwhite),
                        
                      ),
                      child: Row(children: [
                        
                      ],),
                     ) */
                     const Text('Enter MovieName',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      
                           validator: (value) => value!.isEmpty ? "Field is empty ":null,
                           // obscureText: true,
                         // focusNode:,
                          controller:provider.movieNameController,
                       //  inputFormatters: [LengthLimitingTextInputFormatter(v)],
                          textAlign: TextAlign.left,
                        
                          style:const  TextStyle(fontSize: 11,color: textwhite),
                         onChanged: (value) async{
                         
                           if (value.isNotEmpty) {
                             
                             await provider.suggectionGet(context);
                            provider.suggestion(value);
                          //  provider.isSearch=false;
                           }else{
                             const  Center(
                     child: Text("No data",style: TextStyle(color: textwhite
                     ),),
                               );
                           }
                         },
                           
                          
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textFieldBackground,
                            // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                          // icon: Icon(textIcon,color: Colors.white,),
                            prefixIcon:const Icon(Icons.movie,color: Colors.white,),
                            hintText: "Movie Name",hintStyle:const TextStyle(color: Colors.grey),
                            border:
                            OutlineInputBorder(    
                              borderRadius:
                               BorderRadius.circular(13)
                            )
                          
                              
                          ),
                        ),
                  ),provider.isSearch==true?Container(
                    height: 200,
                    width: 300,
                    color: textFieldBackground,
                    child: ListView.builder(
                      itemCount: data.list.length,
                      
                      itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                        provider.valuechanger(index);
                        },
                        child: ListTile(
                        title:Text(data.list[index].originalTitle ,style:const TextStyle(color: textwhite),),
                        ),
                      );
                    },),
                  ):sizedH10,
                //  sizedH20,
    
                   const Text('Enter Show Time',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                                         
                                  validator: (value) => value!.isEmpty ? "Field is empty ":null,
                                  
                                 controller:provider.showTimeController,
                           
                                 textAlign: TextAlign.left,
                               
                                 style:const  TextStyle(fontSize: 11,color: textwhite),
                                onChanged: (value) {
                                
                                showTimepicker(context);
                                  
                                },
                                 onTap: () async{
                                   final selectime = await showTimepicker(context);
                            if (selectime != null) {
                              String timeValues = selectime.toString();
                             
                              provider.showTimeController.text= timeValues.substring(10,15);
                            }},
                                 
                                 decoration: InputDecoration(
                                   filled: true,
                                   fillColor: textFieldBackground,
                                   
                                   prefixIcon:const Icon(Icons.movie,color: Colors.white,),
                                   hintText: "Show Time",hintStyle:const TextStyle(color: Colors.grey),
                                   border:
                                   OutlineInputBorder(    
                                     borderRadius:
                                      BorderRadius.circular(13)
                                   )
                                 
                                     
                                 ),
                               ),
                    ),

                        sizedH20,
                      const Text('Start Date of Movie?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextFormField(
                                       
                                validator: (value) => value!.isEmpty ? "Field is empty ":null,
                               
                               controller:provider.startDateController,
                            
                               textAlign: TextAlign.left,
                             
                               style:const  TextStyle(fontSize: 11,color: textwhite),
                              onChanged: (value) {
                              
                               selectedDate(context);
                                
                              },
                               onTap: () async{
                                 final selectDate = await selectedDate(context);
        if (selectDate != null) {
          String values = selectDate.toString();
         
          provider.startDateController.text= values.substring(0,10);
        }},
                               
                               decoration: InputDecoration(
                                 filled: true,
                                 fillColor: textFieldBackground,
                                 // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                               // icon: Icon(textIcon,color: Colors.white,),
                                 prefixIcon:const Icon(Icons.movie,color: Colors.white,),
                                 hintText: "Start Date",hintStyle:const TextStyle(color: Colors.grey),
                                 border:
                                 OutlineInputBorder(    
                                   borderRadius:
                                    BorderRadius.circular(13)
                                 )
                               
                                   
                               ),
                             ),
                       ),
                       
                  
                    //   sizedH20,
                    
                    sizedH20,
                      const Text('Ending Date of Movie?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                                         
                                  validator: (value) => value!.isEmpty ? "Field is empty ":null,
                                 
                                 controller:provider.endDateController,
                              
                                 textAlign: TextAlign.left,
                               
                                 style:const  TextStyle(fontSize: 11,color: textwhite),
                                onChanged: (value) {
                                
                                 selectedDate(context);
                                  
                                },
                                 onTap: () async{
                                   final selectDate = await selectedDate(context);
                            if (selectDate != null) {
                              String values = selectDate.toString();
                             
                              provider.endDateController.text= values.substring(0,10);
                            }},
                                 
                                 decoration: InputDecoration(
                                   filled: true,
                                   fillColor: textFieldBackground,
                                   // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                                 // icon: Icon(textIcon,color: Colors.white,),
                                  prefixIcon:const Icon(Icons.movie,color: Colors.white,),
                                   hintText: "End Date",hintStyle:const TextStyle(color: Colors.grey),
                                   border:
                                   OutlineInputBorder(    
                                     borderRadius:
                                      BorderRadius.circular(13)
                                   )
                                 
                                     
                                 ),
                               ),
                    ),
                    
                     sizedH20,
                      const Text('Enter price Of Movie?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
                     TextformField1(hintText: 'Price ', textController:provider.ticketPriceController, textIcon: Icons.table_rows_outlined,input: TextInputType.phone,),
                     sizedH20,
                      const Text('Enter Screen Number?',style: TextStyle(color: textwhite,fontSize: 20,fontWeight: FontWeight.bold,),),
                    //  TextformField1(hintText: 'Screen Number ', textController:provider.screenNumberController, textIcon: Icons.table_rows_outlined,input: TextInputType.phone,),
                Container(
                  width: size.width,
                  height: size.height*0.07,
                  padding:const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:colorTextwhite)
                  ),
                  child: Consumer<AddScreenProvider>(
                    builder: (context,data,child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<AddShowProvider>(
                            builder: (context,value,child) {
                              return Text(value.screenNumberController.text,style:const TextStyle(color: textwhite),);
                            }
                          ),
                          DropdownButton(
                                  itemHeight: size.height*0.06,
                                  
                                  items: List.generate(
                                      data.screenInfo.length,
                                      (index) => DropdownMenuItem<dynamic>(
                                          value:data.screenInfo[index].screen.toString() ,
                                          child: Text(data.screenInfo[index].screen.toString(),style:const TextStyle(color: Colors.black,fontSize: 16),))),
                                  onChanged: (values) {
                                    // ignore: avoid_print
                                    provider.valueChanging(values);
               
                                  },
                                  onTap: () => log(provider.screenNumberController.toString()),
                                  
                                  ),
                        ],
                      );
                    }
                  ),
                ),
        
                    sizedH30,
                     ElevatedButton(onPressed: () async{
                      if ( _formkey.currentState!.validate()) {
                        if (editShow==false) {
 // log("ok");v         
             log('editSHow NOT working');
                       lottieshowing(context);
                     await  provider.addShowApi(context);
                     await provider.showGetting(context);
                     provider.movieNameController.clear();
                     provider.screenNumberController.clear();
                     provider.showTimeController.clear();
                     provider.startDateController.clear();
                     provider.endDateController.clear();
                     provider.ticketPriceController.clear();
                    Navigator.pop(context);
                    Navigator.pop(context);
                        }else if(editShow==true){
                       lottieshowing(context);
                        await provider.editShow(context,index);
                         await provider.showGetting(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                       
                          provider.movieNameController.clear();
                     provider.screenNumberController.clear();
                     provider.showTimeController.clear();
                     provider.startDateController.clear();
                     provider.endDateController.clear();
                     provider.ticketPriceController.clear();
                      editShow =false;

                        }
                      //  Navigator.pop(context);
                      //   provider.columnController.clear();
                      //  provider.rowController.clear();
                      //  provider.screenController.clear();
                     
                      }else{
                        getError("please fill the empty field", context);
                      }
                     },style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                     ), child:editShow==false? const Text('Add Screen',style: TextStyle(color: textwhite),)
                     : const Text('Edit Screen',style: TextStyle(color: textwhite),)
                     )
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }



Future<DateTime?>selectedDate(BuildContext context) async{

final initalDate=DateTime.now();
final day1=initalDate.add(const Duration(days:2));
log("okey ramees$day1");
// ignore: non_constant_identifier_names
final FirstDate=initalDate.subtract(const Duration(days: 365 * 100));
final lastDate=FirstDate.add(const Duration(days: 365 * 200));

  final date=await showDatePicker(context:context , initialDate: initalDate, firstDate: FirstDate, lastDate: lastDate);

  return date;


}
 Future<TimeOfDay?> showTimepicker(BuildContext context) async{

  final initialTime=TimeOfDay.fromDateTime(DateTime.now());

  final time=await showTimePicker(context: context, initialTime: initialTime);

  return time;

  }
}
