// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously


import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/search_screen/location_search/show_details.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../../controller/search_screen_provider/search_screen.dart';

class TheatrePage extends StatelessWidget {
  const TheatrePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Consumer<SearchScreenProvider>(
            builder: (context,showTimeData,child) {
              return Column(
                children: [
                  SizedBox(
                    height: size.height*0.1,
                    width: size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon:const Icon( Icons.arrow_back,color: textwhite,))),
                  ),
               //   Text(showTimeData.locationList[0].location.toString(),style: TextStyle(color: textwhite),),
                  Expanded(
                    child: ListView.separated(
                      itemCount: showTimeData.locationList.length,
                      separatorBuilder: (context, index) => sizedH10,
                      itemBuilder: (context, index) {
                    //    log("${showTimeData.locationList[index].location.toString()}");
                        return InkWell(
                          onTap: () async{
                            lottieshowing(context);
                           await showTimeData.theatreShowTimeGet(index);
                        showTimeData.showDateImage(context, index);
                         //  log("1");
                           Navigator.pop(context);
             Navigator.push(context, MaterialPageRoute(builder: (context) =>const TheatreShowTimePage(),));
                      //  log("2");
                        //    Navigator.pop(context);
                          },
                        
                          child: NeumorphicWidget(
                            location: showTimeData.locationList[index].location.toString(),
                            email: showTimeData.locationList[index].email.toString(),
                            theatreName: showTimeData.locationList[index].name!.toString(),
                            phoneNumber: showTimeData.locationList[index].phone!.toString(),
                            index: index,
                          )
                        );
                      },
                    ),
                  ),
                  // sizedH10,
                ],
              );
            }
          ),
        ),
      )),
    );
  }
}

class NeumorphicWidget extends StatelessWidget {
  const NeumorphicWidget({
    super.key,
    required this.location,
    required this.email,
    required this.theatreName,
    required this.phoneNumber,
    required this.index
  });
  final String location;
  final String email;
  final String theatreName;
  final String phoneNumber;
  final index;

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: size.height * 0.2,
        width: size.width,
        child: Neumorphic(
          padding:const EdgeInsets.all(10),
         // margin: EdgeInsets.all(6),
          style: NeumorphicStyle(
              color: textFieldBackground,
              intensity: 5,
              depth: 3,
              shape: NeumorphicShape.convex,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            //  Text("${index+1}",style: TextStyle(color: textwhite),),
            const  Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TheatreName:",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Phone:",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: colorTextwhite),
                  ),
                   Text(
                    "Location:",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: colorTextwhite),
                  ),
                   Text(
                    "phoneNumber:",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: colorTextwhite),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width/2,
                    child: Text(
                      theatreName,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(color: colorTextwhite,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    phoneNumber,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(color: colorTextwhite),
                  ),
                   SizedBox(
                    width: size.width*0.54,
                     child: Text(
                      location,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(color: colorTextwhite),
                                     ),
                   ),
                   Text(
                    email,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(color: colorTextwhite),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
