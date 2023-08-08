import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviesInfo extends StatelessWidget {
  const MoviesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<MoviesProvider>(
        builder: (context,movieInfo,child) {
          return 
          Column(      
            children: [
              SizedBox(
                height: size.height * 0.45,
                width: size.width,
                // color: buttonColor,
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height * 0.24,
                      width: size.width,
                      // decoration:const BoxDecoration(
                      //     // color: Colors.amber,
                      //     image: DecorationImage(
                      //         image: NetworkImage(
                      //             'https://www.themoviedb.org/t/p/w220_and_h330_face/34m2tygAYBGqA9MXKhRDtzYd4MR.jpg'),
                      //         fit: BoxFit.fill)
                      //         ),
                      child: Image.network('https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movieInfo.movieDetails[0].backdropPath}',
                      fit: BoxFit.fill,
                       loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress==null) {
                                  return child;
                                }else{
                                  return const Center(child: CircularProgressIndicator(),);
                                }
               } ),
                    ),
                    Positioned(
                      top: 170,
                      left: 30,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                            height: size.height * 0.25,
                            width: size.width * 0.38,
                            child: Image.network(
                             'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movieInfo.movieDetails[0].posterPath}' ,
                              fit: BoxFit.fill,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress==null) {
                                  return child;
                                }else{
                                  return const Center(child: CircularProgressIndicator(),);
                                }
                              },
                            )
                            ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: size.width * 0.5,
                      child: MovieDetails(
                          size: size,
                          filimTitle: movieInfo.movieDetails[0].originalTitle,
                          directorTitle: movieInfo.movieDetails[0].productionCompanies[0].name.toString(),
                          genreTitle: movieInfo.movieDetails[0].genres[0].name,
                          writerTitle: ''
                          ),
                    )
                    // Text('hii',style: TextStyle(color: textwhite),)
                  ],
                ),
              ),
              //  Text('ramees',style: TextStyle(color: colorTextwhite),)
              sizedH30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.29,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorTextwhite),
                    ),
                    child:  Center(
                        child: Text(
                      movieInfo.movieDetails[0].voteAverage.toString(),
                      style:const TextStyle(
                          color: textwhite,
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                    )),
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorTextwhite)),
                    child:  Column(
                      children: [
                        sizedH20,
                     const   Text(
                          'Dueration',
                          style: TextStyle(color: colorTextwhite),
                        ),
                        Text(
                          '${movieInfo.movieDetails[0].runtime}Mins',
                          style:const TextStyle(
                              color: textwhite, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colorTextwhite)),
                    child:  Column(
                      children: [
                        sizedH20,
                        Text(
                          'Adults',
                          style: TextStyle(color: colorTextwhite),
                        ),
                      movieInfo.movieDetails[0].adult==false? const  Text(
                         '13+',
                          style: TextStyle(
                              color: textwhite,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ):const Text(
                         '18+',
                          style: TextStyle(
                              color: textwhite,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // sizedH20,
              const Text(
                'Overview',
                style: TextStyle(color: textwhite, fontWeight: FontWeight.bold),
              ),
                 Padding(
               padding:const EdgeInsets.all(8.0),
               child: Text(
                 movieInfo.movieDetails[0].overview,
                 style:const TextStyle(color: colorTextwhite, fontSize: 12),
               ),
                 ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text('Casts',style: TextStyle(color: textwhite,fontSize: 22,fontWeight: FontWeight.bold),)),
                   Flexible(
                     child:
                          ListView.separated(
                            separatorBuilder: (context, index) => sizedH10,
                            scrollDirection: Axis.horizontal,
                            itemCount: movieInfo.castList.length,
                     itemBuilder: (context, index) {
                       return  CastView(size: size, name: movieInfo.castList[index].name!, imagePath:movieInfo.castList[index].profilePath!, originalName: movieInfo.castList[index].originalName!,);
                      
                       },                          
                
                            
                          )
                      
                   ),
                
                   
              // SizedBox(
              //   width: size.width * 0.85,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: buttonColor,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(13),
              //           )),
              //       onPressed: () {
              //         Navigator.push(context, MaterialPageRoute(builder:(context) =>const BookingPage() ));
              //       },
              //       child: const Text(
              //         'Book Tickets',
              //         style: TextStyle(color: textwhite),
              //       )),
              // )
            
          
            ],
          );
        }
      ),
      floatingActionButton: SizedBox(
        width: size.width*0.9,
        child: FloatingActionButton(
          backgroundColor: buttonColor,
          onPressed: () {          
        },
        child:const Text("Book Tickets",style: TextStyle(color: textwhite,fontSize: 19,fontWeight: FontWeight.w600),),
        
        ),
      ),
    );
  }
}

class CastView extends StatelessWidget {
  const CastView({
    super.key,
    required this.size, required this.imagePath, required this.name, required this.originalName,
    
  });
  final String imagePath;
  final String name;
  final String originalName;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
   //  width: size.width,
     height: size.height*0.6,
     decoration:const BoxDecoration(
       color: textwhite
     ),
     child: Column(
       children: [
         CircleAvatar(
      backgroundImage:NetworkImage(imagePath),
       radius: 40,  ),
        const Text('ramees',style: TextStyle(color: textwhite,fontSize: 20),),
        const Text('originalName')
       ],
     ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.size,
    required this.filimTitle,
    required this.directorTitle,
    required this.writerTitle,
    required this.genreTitle,
  });
  final String filimTitle;
  final String directorTitle;
  final String writerTitle;
  final String genreTitle;
  final Size size;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: size.width * 0.5,
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              filimTitle,
              style: const TextStyle(color: Colors.amberAccent),
            ),
            sizedH30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Director:',
                  style: TextStyle(color: colorTextwhite),
                ),
                sizedW10,
                SizedBox(
                  width: size.width*0.2,
                  child: Text(
                    directorTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: colorTextwhite,
                    ),
                  ),
                )
              ],
            ),
             sizedH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Writter:',
                  style: TextStyle(color: colorTextwhite),
                ),
                sizedW10,
                SizedBox(
                  width: size.width*0.2,
                    child: Text(
                  writerTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorTextwhite),
                ))
              ],
            ),
            sizedH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Genre:',
                  style: TextStyle(color: colorTextwhite),
                ),
                //  sizedW10,
                SizedBox(
                  width: size.width*0.2,
                    child: Text(
                  genreTitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: colorTextwhite,
                  ),
                )),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
