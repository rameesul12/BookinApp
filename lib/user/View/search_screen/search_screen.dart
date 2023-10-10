


// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../common/dialogues.dart';
import '../../controller/movie_pages_provider/home_page_providerr.dart';
import '../../controller/search_screen_provider/search_screen.dart';
import '../moviesInfo/selected_movies.dart';
import 'location_search/location_theatre.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});



  @override
  Widget build(BuildContext context) {
    TextEditingController query=TextEditingController();
    final provider=Provider.of<SearchScreenProvider>(context,listen: false);
    final providerMovie=Provider.of<MoviesProvider>(context,listen: false);
  //  bool isEmpty=false;
    Debouncer debouncer=Debouncer();
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
     body: SafeArea(child: 
     SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(
            height: size.height,
            width: size.width,
             child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                   // textInputAction:isLast==null? TextInputAction.next:TextInputAction.none,
                 
                
                // obscureText: true,
               // focusNode:,
              
              controller:query,
                textAlign: TextAlign.left,
              //  keyboardType:input ,
                style:const  TextStyle(fontSize: 11,color: textwhite),
                
                onChanged: (value) {
                  debouncer.run(() async{ 
                //    isEmpty=true;
                lottieshowing(context);
                 await provider.searchDataGet(context,query.text,);
                // query.clear();
                 Navigator.pop(context);
                 // provider.movieSearch(query.text);
                  provider.locationSearch(query.text);
    
                  });
                  
                    // log(query.text);
                },
                
                onTap: () {
                 query=query;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textFieldBackground,
                  // contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                // icon: Icon(textIcon,color: Colors.white,),
                  prefixIcon: IconButton(icon:const Icon( Icons.arrow_back),color: Colors.white,onPressed: (){
                  Navigator.pop(context);
                  },),
                  hintText: "Search the movies or Theatres",hintStyle:const TextStyle(color: Colors.grey),
                  border:
                  OutlineInputBorder(    
                    borderRadius:
                     BorderRadius.circular(13)
                  )
                
                    
                ),
                  )
                ),
                
                 provider.textLoaded==false ?Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      height: size.height*0.9,
                      child: Column(
                        children: [
                      // SizedBox(height: size.height*0.2,
                      
                      // child:Lottie.asset('assets/animation/animation_ll0s7qfl.json',repeat: true,reverse: true) ,),
                                  const Text("Top Recomented Movies",style: TextStyle(color: colorTextwhite,fontSize: 17 ,fontWeight:FontWeight.bold)),
                         sizedH10,
                          Consumer<MoviesProvider>(
                            builder: (context,fullMovies,child) {
                              return SizedBox(
                                height: size.height*0.8,
                                width: size.width,
                               // color: textwhite,
                                child: GridView.builder(
                                  physics:const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  mainAxisExtent: 200,
                                  ),
                                  itemCount: 6,
                                   itemBuilder:(context, index) {
                                     return InkWell(
                                      onTap: () async{
                                        lottieshowing(context);
                                                      await providerMovie.moviesData(index, context);
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MoviesInfo(),
                                  ));
                                      },
                                       child: SizedBox(
                                                                        // height: size.height*0.6,
                                                                      //   color: Colors.blue,
                                                                        child: Column(
                                                                         children: [
                                        Image.network('https://www.themoviedb.org/t/p/w300_and_h450_bestv2${fullMovies.moviesList[index].image}',fit: BoxFit.fill,
                                        height: size.height*0.2,
                                        width: size.width,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress==null) {
                                            return child;
                                          }else{
                                            return const Center(child: CircularProgressIndicator());
                                          }
                                        },
                                        ),
                                        Text(fullMovies.moviesList[index].title,style:const TextStyle(color: textwhite),
                                        
                                        )
                                                                         ],
                                                                        ),
                                                                         
                                       ),
                                     );
                                   },),
                              );
                            }
                          )
                           
                        ],
                      ),
                    ),
                  ),
                ):SizedBox(
                  height: size.height*0.9,
                width: size.width,
                child:  Consumer<SearchScreenProvider>(
                  builder: (context,searchData,child) {
                    
                    return Column(
                          children: [
                          searchData.locationList.isNotEmpty?   SizedBox(
                                                       height: size.height*0.2,
                                                       child: ListView.builder(
                                                         physics:const NeverScrollableScrollPhysics(),
                                                         shrinkWrap: true,
                                                         itemCount: searchData.locationList.length,
                                                         itemBuilder:(context, index) {
                                                           
                                                           return  InkWell(
                                                             onTap: (){
                                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>const TheatrePage(),));
                                                             },
                                                            child: SearchListView(title:searchData.locationList[index].location!,));
                                                         }, ),                      
                                                     ):sizedH10,
                             
                       searchData.movieLists.isNotEmpty?   Column(
                         children: [
                          const Text('Movies you searched',style: TextStyle(color: textwhite,fontWeight: FontWeight.bold,fontSize: 19),),
                           sizedH20,
                           SizedBox(
                                            height: size.height*0.82,
                                            width: size.width,
                                          //  color: textwhite,
                                            child: GridView.builder(
                                              physics:const NeverScrollableScrollPhysics(),
                                              primary: false,

                                              shrinkWrap: true,
                                              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              crossAxisSpacing: 15.0,
                                              mainAxisSpacing: 15.0,
                                              mainAxisExtent: 200,
                                              ),
                                              itemCount: searchData.searchList.length,
                                               itemBuilder:(context, index) {
                                                 return InkWell(
                                                  onTap: () async{
                                                  //  log("amina");
                                                    log("ramees${searchData.indexList[index]
                                                    }");
                                                     lottieshowing(context);
                                                      await providerMovie.moviesData(searchData.indexList[index], context);
                                                     // Navigator.pop(context);
                                                      Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const MoviesInfo(),
                                            ));
                                                  },
                                                   child: SizedBox(
                                                                                           height: size.height*0.5,
                                                                                        //   color: Colors.blue,
                                                                                          child: Column(
                                                                                           children: [
                                                    Image.network('https://www.themoviedb.org/t/p/w300_and_h450_bestv2${searchData.movieLists[index].image}',fit: BoxFit.fill,
                                                    height: size.height*0.2,
                                                    width: size.width,
                                                    loadingBuilder: (context, child, loadingProgress) {
                                                      if (loadingProgress==null) {
                                                        return child;
                                                      }else{
                                                        return const Center(child: CircularProgressIndicator());
                                                      }
                                                    },
                                                    ),
                                                    Text(searchData.movieLists[index].title.toString(),style:const TextStyle(color: textwhite),
                                                    
                                                    )
                                                                                           ],
                                                                                          ),
                                                                                           
                                                   ),
                                                 );
                                               },),
                                          ),
                         ],
                       ): SizedBox(
                                        height: size.height*0.3,
                                        child: 
                                    Column(
                                      children: [
                                        Center(child: Lottie.asset('assets/animation/animation_ll0s7qfl.json',reverse: true,height: size.height*0.2,width: size.width*0.3),
                                        
                                        ),
                                      const  Text("No Movies",style: TextStyle(color: textwhite),)
                                      ],
                                    )
                                      ,),
                          // Expanded(
                          //   child: Consumer<SearchScreenProvider>(
                          //   builder: (context,movieList,child) {
                          //     return SizedBox(
                          //               height: size.height*0.8,
                          //               width: size.width,
                          //              // color: textwhite,
                          //               child: GridView.builder(
                          //                 physics:const NeverScrollableScrollPhysics(),
                          //                 shrinkWrap: true,
                          //                 gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          //                   crossAxisCount: 2,
                          //                 crossAxisSpacing: 12.0,
                          //                 mainAxisSpacing: 12.0,
                          //                 mainAxisExtent: 200,
                          //                 ),
                          //                 itemCount: movieList.movieLists.length,
                          //                  itemBuilder:(context, index) {
                          //                    return SizedBox(
                          //                 // height: size.height*0.6,
                          //                //color: Colors.blue,
                          //                  child: Column(
                          //                   children: [
                          //                     Image.network('https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movieList.movieLists[index].image}',fit: BoxFit.fill,
                          //                     height: size.height*0.2,
                          //                     width: size.width,
                          //                     loadingBuilder: (context, child, loadingProgress) {
                          //                       if (loadingProgress==null) {
                          //                         return child;
                          //                       }else{
                          //                         return const Center(child: CircularProgressIndicator());
                          //                       }
                          //                     },
                          //                     ),
                          //                     Text(movieList.movieLists[index].title!,style:const TextStyle(color: textwhite),
                                              
                          //                     )
                          //                   ],
                          //                  ),
                                            
                          //                    );
                          //                  },),
                          //             );
                          //       }
                          //                     ),
                          // ),
               
                          ],
                           
                           
                        );
                  }
                )
                  
                ),
                
                
              ],
             ),
           ),
         ],
       ),
     )),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.title,
    
  });
  final String title;
  // final String? poster;


  @override
  Widget build(BuildContext context) {
     final Size size=MediaQuery.of(context).size;

    return SizedBox(
      height:size.height*0.1 ,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/placeholder.png',fit: BoxFit.fitHeight,width: 30,height: 20,),
                sizedW30,
                  Expanded(child: Text(title,style:const TextStyle(color: textwhite),))
          
          ],
        ),
      ),
    );
  }
}

class Debouncer{

  


  int? milliSeconds;
VoidCallback? action;
Timer? timer;

run(VoidCallback action){
  if (null != timer) {
    timer!.cancel();
  }
  timer=Timer(const Duration(milliseconds: Duration.millisecondsPerSecond),
      action);
}

}