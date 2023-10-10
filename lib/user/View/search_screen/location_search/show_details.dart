// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:bookingapp/user/View/moviesInfo/selected_movies.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../controller/search_screen_provider/search_screen.dart';

class TheatreShowTimePage extends StatelessWidget {
  const TheatreShowTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Consumer<SearchScreenProvider>(
              builder: (context,showTimeData,child) {
                return Column(
                  children: [
                 //   Text(showTimeData.locationList[0].location.toString(),style: TextStyle(color: textwhite),),
                    Expanded(
                      child: ListView.separated(
                        itemCount: showTimeData.images.length,
                        separatorBuilder: (context, index) => sizedH10,
                        itemBuilder: (context, index) {
                      //    log("${showTimeData.locationList[index].location.toString()}");
                          return InkWell(
                            onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const MoviesInfo(),));
                            //  showTimeData.showDateImage(context, index);
                            },
                            child: NeumorphicWidgetClass(
                              location: showTimeData.showDatas[index].location, 
                              showTime: showTimeData.showDatas[index].showTime,
                               movieName: showTimeData.showDatas[index].movieName,
                                image: showTimeData.images[index],
                             
                             
                            ),
                          );
                        },
                      ),
                    ),
                   // sizedH60,
                  ],
                );
              }
            ),
          ),
        ),
      )),
    );
  }
}

class NeumorphicWidgetClass extends StatelessWidget {
 const  NeumorphicWidgetClass({
    super.key,
    required this.location,
    required this.movieName,
   
    required this.showTime,
    required this.image
  });
  final movieName;
  final String location;
  final showTime;
 final String image;
   

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height * 0.3,
        width: size.width,
        child: Neumorphic(
          padding:const EdgeInsets.all(10),
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
              // Text("${index+1}",style: TextStyle(color: textwhite),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                Container(
                  height: size.height*0.23,
                  width: size.width*0.3,
                  decoration: BoxDecoration(
                  color: textwhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network("https://www.themoviedb.org/t/p/w300_and_h450_bestv2$image",
                   fit: BoxFit.fill,
                   loadingBuilder: (context, child, loadingProgress) {
                     if (loadingProgress==null) {
                       return child;
                     }else{
                      return const CircularProgressIndicator();
                     }
                   },
                  ),
                )
              ],),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Flexible(
                  //  width: 150,
                    child: Row(
                      children: [
                     
                        SizedBox(
                          width: size.width*0.5,
                          child: Text(
                            movieName,
                            overflow: TextOverflow.ellipsis,
                            style:const TextStyle(color: colorTextwhite,fontSize: 20,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    width: size.width*0.5,
                    child: TextScroll(
                      
                     location ,
                  //   delayBefore: Duration(seconds: 10),
                     textDirection: TextDirection.ltr,
                     mode: TextScrollMode.endless,
                      style:const TextStyle(color: colorTextwhite),
                    ),
                  ),
                   Container(
                  width: size.width*0.3,
                  height: size.height*0.06,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   const  Text("Showtime",style: TextStyle(fontWeight: FontWeight.bold,color: colorTextwhite),),
                      Text(showTime),
                    ],
                  ),
                ) 
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
