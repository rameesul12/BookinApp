// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/search_screen/search_screen.dart';
import 'package:bookingapp/user/View/settings/settings.dart';
import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:bookingapp/user/core/constant/constanwidgets.dart';
import 'package:bookingapp/user/View/moviesInfo/selectedMovies.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/fireBbse_Functions/firebase_function.dart';
import '../../core/couponContainer/coupenCard.dart';
import '../../variables/sizedbox.dart';
import '../latestMovies/trending.dart';
import 'package:text_scroll/text_scroll.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<FireBaseFunctionProvider>(context, listen: false);
    final Size size = MediaQuery.of(context).size;

    return  Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor:backgroundColor,
          title:const Center(child: Text('malappuram',style:TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 20),)),
          actions: [
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    provider.valueDisplaying(snapshot);
                    return Consumer<FireBaseFunctionProvider>(
                        builder: (context, bannerData, child) {
                      return Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerData.bannerList.length,
                            separatorBuilder: (context, index) => sizedH10,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Container(
                                      height: size.height * 0.4,
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: const BoxDecoration(
                                          color: backgroundColor),
                                      //   child: Text('text ', style: TextStyle(fontSize: 16.0),)
                                      child: Image.network(
                                        "${bannerData.bannerList[index].imagePath}",
                                        fit: BoxFit.fill,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return const Center(
                                                child: CircularProgressIndicator());
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    //top: ,
                                    child: SizedBox(
                                      child: TextScroll(
                                        bannerData
                                            .bannerList[index].movieDescription
                                            .toString(),
                                            
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: textwhite),
                                            
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.ltr,
                                             mode: TextScrollMode.endless,
                                             
                                      ),
                                    ),
                                  ),
                                ],
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
                    },
                    child: const Text(
                      'SeeMore>',
                      style: TextStyle(
                        color: textwhite,
                      ),
                    ))
              ],
            ),
            // Row(
            //   children: [
    
            //   ],
            // ),
            //  sizedH10,
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
                     return CouponCard(imagepath:upcomingMovie.upcomingList[index].backdropPath,texttitle: upcomingMovie.upcomingList[index].title, releasingDate: upcomingMovie.upcomingList[index].releaseDate.toString().substring(0,10),);

                   },
                  ),
                );
              }
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.topic)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingPage(),
                            ));
                      },
                      icon: const Icon(Icons.person)),
                ],
              ),
            )
          ],
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
              width: 140,
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
          SizedBox(
              width: size.width * 0.36,
              child: Text(
                filimTitle,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: textwhite, fontWeight: FontWeight.w800),
              )),
        ],
      ),
    );
  }
}
