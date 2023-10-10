// ignore_for_file: use_build_context_synchronously

import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/user/View/moviesInfo/selected_movies.dart';
import 'package:bookingapp/user/controller/movie_pages_provider/home_page_providerr.dart';
import 'package:bookingapp/user/variables/colors.dart';
import 'package:bookingapp/user/variables/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/theatre_showing/theatre_showing_controller.dart';
import '../dataAndTime/date_and_time.dart';
const imageUrl='https://www.themoviedb.org/t/p/w220_and_h330_face/gO9k7t9jSdkkWVG0deMZDpELZGw.jpg';
class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
            title: const Text('Movies',style: TextStyle(color: textwhite,fontWeight: FontWeight.w800),),
      ),
      body: Consumer<MoviesProvider>(
        builder: (context,data,child) {
          return ListView.separated(

            itemBuilder:(context, index) =>  InkWell(
              onTap: () async{
                lottieshowing(context);
                 await data.movieCastAndCrew(index, context);
              await  data.moviesData(index, context);
              data.listTolistChanging();

              
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context) => const MoviesInfo(),));
              },
              child:data.moviesList.isEmpty?const Center(child: CircularProgressIndicator(),): ListViewPage(movieName:data.moviesList[index].title, imagepath: 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${data.moviesList[index].image}', language: data.moviesList[index].language, releaseDate: data.moviesList[index].releaseDate.toString().substring(0,10),)) , 

           separatorBuilder: (context, index) => sizedH10,
            itemCount: data.moviesList.length);
        }
      ),
       
      );
    
  }
}

class ListViewPage extends StatelessWidget {
 const  ListViewPage({super.key, required this.movieName, required this.imagepath, required this.releaseDate, required this.language,});
final String movieName;
final String imagepath;
final String releaseDate;
final String language;

  @override
  Widget build(BuildContext context) {
     final provider=Provider.of<MoviesProvider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height:140 ,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
             
            ),
            child: Image.network(imagepath,fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress==null) {
                return child;
              }else{
                return Center(child: CircularProgressIndicator(
                   value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                ));
              }
    
            },
            ),
          ),
        const  SizedBox(width: 20,),
          Expanded(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movieName,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold ,fontSize: 16),),
                sizedH20,
                Text(releaseDate,style:const TextStyle(color: colorTextwhite,fontSize: 11),),
               //  sizedH10,
                Text(language,style:const TextStyle(color: colorTextwhite,fontSize: 14,fontWeight: FontWeight.bold)),
               sizedH10,
               SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width* 0.29,
                  child: ElevatedButton(onPressed: ()async{
                    
                    lottieshowing(context);
                            await Provider.of<TheatreShowingController>(context,listen: false).allTheatreGetting(context);  
                    provider.listTolistChanging();
                    Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => DateandTimepage(filimTitile:provider.movieDetails[0].title),));    

                  },style: ElevatedButton.styleFrom(
                    padding:const EdgeInsets.all(0),
                    backgroundColor: buttonColor,
                   shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(6)
                   )
                  ), child:const Text('Booking',style: TextStyle(color: textwhite),),),
                )
              ],
            ),
          )
      
        ],
      ),
    );
  }
  
}