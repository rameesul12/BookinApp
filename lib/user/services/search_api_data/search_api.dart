import 'package:bookingapp/user/apiConfigurationclass/configuration.dart';
import 'package:http/http.dart'as http;


Future searchApi(String query) async{

 final http.Response response;
 final payload=query;

 final baseUrl=ApiConfiguration.baseUrl;
 const search=ApiConfiguration.getSearch;


 response=await http.get(Uri.parse(baseUrl+search+payload));

 return response;

}