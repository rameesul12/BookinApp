

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:bookingapp/common/dialogues.dart';
import 'package:bookingapp/common/secure_storage/flutter_securestorage.dart';
import 'package:bookingapp/user/Model/home_Page_Movies/get_movies.dart';
import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:bookingapp/user/services/api_call_functions.dart/api_call_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../../Model/filim_Cast_Crew/cast_crew_model.dart';
import '../../Model/movie_Info/movie_detals.dart';
import '../../Model/upcoming_movies/upcoming_movie_model.dart';


class MoviesProvider extends ChangeNotifier{

  List<MoviesData>moviesList=[];
  List<MoviesData>movie=[];
  List<MoviesData>theatrePageList=[];
  List<GetFullMovieDetails>movieDetails=[];
  List<Cast>castList=[];
  List<Result>upcomingList=[];
 int currentIndex=0;
 Map<String,dynamic>? getMoviesData;


  bottomValueChanging(int index){
   currentIndex=index;
    notifyListeners();
  }


//====================================
//Home page Recomemeded movies getting
//====================================
  Future homeGetMovies(BuildContext context) async{
    final http.Response response;
    final getMovies=ApiConfiguration.getMovies;
    
    final token=await storageUser();

    try {
      response=await ApiFunctions.apiGetFunction(getMovies, token);
    final status=jsonDecode(response.body)as Map<String,dynamic>;

    if (status['success']==true) {
      moviesList=(status['data']as List).map((e) =>MoviesData.fromJson(e)).toList();
      log(moviesList.length.toString());
      listValueChanging();
     languageChanging();
      notifyListeners();

     // log(movieDetails[0].backdropPath);
   
     // languageChanging();
      // log("movies Added");
    }else{
      log("No movies Added");
    }
    } catch (e) {
      log("home movies error");
      log(e.toString());
    }
  }
//**************************** */

 //====================================
// MovieDetails List id and FullMovieList comparing and taking those full data to another List
//====================================

 listTolistChanging(){
 if (movieDetails.isNotEmpty) {
  // log("yeah ok");
    theatrePageList.clear();
  for (var element in moviesList) {
     if (element.title==movieDetails[0].title) {
         
       theatrePageList.add(element); 

     notifyListeners();
     }
  }
 }else{
  log("MovieDetails is empty");
 }

 }



//**************************** */
//====================================
//home page recommended movies listing
//====================================


 listValueChanging(){

//  final size=moviesList.length-6;
// log(size.toString());
  for (var i = 0; i <moviesList.length ; i++) {
    if (i==6) {
      break;
    }else{

    movie.add(moviesList[i]);
      
     log(moviesList[i].id.toString());    
    }
  }
  notifyListeners();
  log(movie.toString());
 }
 //**************************** */

 //====================================
//languege changing
//====================================

 languageChanging(){
  int index=0;
  for (var element in moviesList) {
    if (element.language=='en') {

      moviesList[index].language='English';
      index++;
    }else if(element.language=='ja'){
      moviesList[index].language='Japanice';
      ++index;
    }else if(element.language=='cn'){
      moviesList[index].language='Japanice';
      ++index;
    }else{
      moviesList[index].language="Tamil";
      ++index;
    }
    
  }
  notifyListeners();

 }
//**************************** */


 //====================================
// by clicking a movie from home or seemore page from there 
//getting full details of that movies
//====================================
  
  Future moviesData(int index,BuildContext context)async{
  
  final http.Response response;
  log(index.toString());
   final movieId=moviesList[index].movieId;
   log(movieId.toString());

  response=await http.get(Uri.parse('${ApiConfiguration.baseUrlFilim}/movie/$movieId?api_key=${ApiConfiguration.apiKey}'),
   headers: {
    'Content-type': 'application/json;charset=utf-8',
      'Accept': 'application/json',
   }
  );


   final statusdata=jsonDecode(response.body)as Map<String,dynamic>;

    // List<GetFullMovieDetails> temp=[];
   GetFullMovieDetails details=GetFullMovieDetails.fromJson(statusdata);
  movieDetails.clear();
    movieDetails.addAll({details});
    log("movieDetails");
   // log("${movieDetails[0]}");
    getMoviesData=statusdata;
   
    notifyListeners();
  // movieDetails=(statusdata as List).map((e) => GetFullMovieDetails.fromJson(e)).toList();  
  log(getMoviesData.toString());
   
  }
  //**************************** */


 //====================================
// by clicking a movie from home or seemore from there cast and crew wil take from here
//
//====================================

 Future movieCastAndCrew(int index,BuildContext context)async{
  
  final http.Response response;
  log(index.toString());
   final id=moviesList[index].movieId;
  //log(movieId.toString());

 try {
    response=await http.get(Uri.parse('${ApiConfiguration.baseUrlFilim}/movie/$id/credits?api_key=${ApiConfiguration.apiKey}'),
 
  );


   final status=jsonDecode(response.body)as Map<String,dynamic>;

    // List<GetFullMovieDetails> temp=[];
    castList.clear();
   MovieCast cast=MovieCast.fromJson(status);
  for (var data in cast.cast) {
    castList.add(data!);
  }
  log("okey DOne");
log(castList.toString());
    log('okey cast');
    notifyListeners();
    
 } catch (e) {
   log(e.toString());
 }
  // movieDetails=(statusdata as List).map((e) => GetFullMovieDetails.fromJson(e)).toList();  

  }
  //**************************** */



//====================================
// home page upcoming movie section
//
//====================================

Future upcomingMoviesGet(BuildContext context) async{

 const baseUrl=ApiConfiguration.baseUrlFilim+ApiConfiguration.upcomingMovies;

 final http.Response response;

try {
    response=await http.get(Uri.parse('$baseUrl?api_key=${ApiConfiguration.movieApiKey}'));
  final data=jsonDecode(response.body)as Map<String,dynamic>;
 upcomingList.clear();
  if (response.statusCode==200) {
    upcomingList=(data['results']as List).map((e) => Result.fromJson(e)).toList();
    log(upcomingList.toString());
    log("succes");
    notifyListeners();
  }else{
    getError("somthing went Wrong", context);
  }
} catch (e) {
  log("home get movies error");
 log(e.toString());
}



}
//**************************** */




} 