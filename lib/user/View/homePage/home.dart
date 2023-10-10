// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/homePage/widgets/shimmer_widgets.dart';
import 'package:bookingapp/user/View/search_screen/search_screen.dart';
import 'package:bookingapp/user/View/settings/settings.dart';
import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:bookingapp/user/View/moviesInfo/selected_movies.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/current_location/current_location.dart';
import '../../controller/fireBbse_Functions/firebase_function.dart';
import '../../controller/razor_pay/razor_pay_controller.dart';
import '../../core/couponContainer/coupen_card.dart';
import '../../variables/sizedbox.dart';
import '../latestMovies/trending.dart';
import '../show_ticket/screen_show_tickets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  //  int currentIndex=0;
    final provider =
        Provider.of<FireBaseFunctionProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return  Scaffold(
        backgroundColor: backgroundColor,
      
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
   
       //    ScreenHomeShimmer(size: size),

            Consumer<CurrentLocation>(
              builder: (context,locationData,child) {
                return SizedBox(
                  height: size.height*0.1,
                  width: size.width,
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                                   //   crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sizedW10,
                            Image.asset('assets/images/placeholder.png',height: size.height*0.04,
                            width: size.width*0.04,
                            ),
                           Text(locationData.currentAddress,style:const TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(
                              width: size.width*0.2,
                            ),
                            Consumer<RazorPayController>(
                              builder: (context,data,child) {
                                return data.isLoaded==false? InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SchowTicketsScreen(),));
                                  },
                                  child: Image.asset('assets/images/ticket.png',fit: BoxFit.contain,
                                  width: size.width*0.08,
                                  ),
                                ):const Text("ta",style: TextStyle(color: backgroundColor),)  ;
                              }
                            ),
                            InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const SearchScreen(),));
                        },
                        child: SizedBox(
                          height:30 ,
                          width: size.width*0.2,
                          child: Image.asset('assets/images/loupe.png')),
                                  ),
                                   
                          ],
                        ),
                         Positioned(
                              right: 90,
                              top: 08,
                              
                              child:   Consumer<RazorPayController>(
                              builder: (context,data,child) {
                                return CircleAvatar(
                                    radius: 4,
                                    backgroundColor:data.isLoaded==false? Colors.red:backgroundColor,
                                  );
                                }
                              ),
                            ),
                      ],
                    ),
                  ),
                );
              }
            ),
           
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('MovieBanner')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(
                      child: Text("No Banner Active"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return ScreenHomeShimmer(size: size);
                  } else {
                    provider.valueDisplaying(snapshot);
                    return Consumer<FireBaseFunctionProvider>(
                        builder: (context, bannerData, child) {
                      return SizedBox(
                        height: size.height*0.25,
                    //  width: size.width*0.8,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerData.bannerList.length,
                            separatorBuilder: (context, index) =>const Divider(color: colorTextwhite),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: size.height * 0.4,
                                  
                                  width: MediaQuery.of(context).size.width*0.9,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration:  const BoxDecoration(
                                   // borderRadius: BorderRadiusDirectional.circular(20),
                                      color: backgroundColor),
                                  //   child: Text('text ', style: TextStyle(fontSize: 16.0),)
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${bannerData.bannerList[index].imagePath}",
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const Center(child: CircularProgressIndicator(),);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    });
                  }
                }),
            sizedH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.01,
                // ),
                const Text(
                  "Recommented Movies",
                  style: TextStyle(
                      color: textwhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.5,
                // ),
                sizedW30,
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LatestMovies(),
                          ));
                      //  Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>  ScreenHomeShimmer(size: size,),
                       //   ));
                    },
                    child: const Text(
                      'SeeMore>',
                      style: TextStyle(
                        color: textwhite,
                      ),
                    ))
              ],
            ),
           
           
            Expanded(
              child:
                  Consumer<MoviesProvider>(builder: (context, movies, child) {
                return movies.movie.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: movies.movie.length,
                        itemBuilder: (context, index) => InkWell(
                            onTap: () async {
                              lottieshowing(context);
                              await movies.movieCastAndCrew(index, context);
                              await movies.moviesData(index, context);
                               movies.listTolistChanging();
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MoviesInfo(),
                                  ));
                            },
                            child: MainCard(
                              imageUrl:
                                  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movies.moviesList[index].image}',
                              filimTitle: movies.moviesList[index].title,
                            )),
                        // children: List.generate(10, (index) =>  InkWell(
                        //   onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => MoviesInfo(),)),
                        //   child: MainCard( imageUrl: 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aVGDZYISKsiyyGdlX09LPLK01fb.jpg',filimTitle: 'Spiderman',)),),
                      );
              }),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upcoming Movies',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                )),
                sizedH10,
            //sizedH30,
            Consumer<MoviesProvider>(
              builder: (context,upcomingMovie,child) {
                return Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                   itemCount: 3,
                   separatorBuilder: (context, index) => sizedW20,
                   itemBuilder: (context, index) {
                     return CouponCard(imagepath:upcomingMovie.upcomingList[index].posterPath,overview: upcomingMovie.upcomingList[index].overview, releasingDate: upcomingMovie.upcomingList[index].releaseDate.toString().substring(0,10),);

                   },
                  ),
                );
              }
            ),
         
          ],
        ),
        bottomNavigationBar: Consumer<MoviesProvider>(
          builder: (context,indexChanger,child) {
            return BottomNavigationBar(
              
                 type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor,
               selectedItemColor: Colors.blue,
               unselectedItemColor: Colors.white70,
              // currentIndex:indexChanger.currentIndex,

              
               
              items:const [
                
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,color: textwhite,),
                 label:"Home"
                ),
                BottomNavigationBarItem(
                  backgroundColor: colorTextwhite,
                  icon: Icon(Icons.settings,color: textwhite,),
                 label:"Settings"
                )

              ],
              onTap: (index) {
                log(index.toString());
              //  indexChanger.bottomValueChanging(currentIndex);
             indexChanger.bottomValueChanging(index);
             
                if (index==0) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen(),));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const SettingPage(),));
                }
              },
               );
          }
        ),
      );
  }
}



// ignore: must_be_immutable
class MainCard extends StatelessWidget {
  final String imageUrl;
  final String filimTitle;
  const MainCard({
    super.key,
    required this.imageUrl,
    required this.filimTitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Container(
              height: 150,
              width: size.width*0.6,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: textFieldBackground,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
                },
              ),
              // child: Text('me'),
            ),
          ),
          sizedH10,
          SizedBox(
              width: size.width * 0.5,
              child: Text(
                filimTitle,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: textwhite, fontWeight: FontWeight.w800),
              )
              ),
        ],
      ),
    );
  }
}
