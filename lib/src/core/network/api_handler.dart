import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
class ApiHandler{


  static getRequest({required String apiUrl})async{

    var headers={
      "Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.ehdWQiOiJiZmJhNWRmYzAyM2Q1YTYzMTIyYmMyJ5YTgyNWYxY2U2OCIsIm5iZiI6MTcyNzAwMTE1OS43ODg5NDcsInN1YiI6IjY2ZWZlZmVkNGE3ZjBiMThiMDI2NGU3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lhBxxD2EJ_5QS9eAg1lPJEjx03HAv9WVvtUM6-TKobs",
      "Content-Type" : "application/json;charset=utf-8",
      "accept":"application/json"

    };

    http.Response response=await http.get(Uri.parse(apiUrl),headers:headers);

    return response;
  }




  static handleResponse(http.Response response)async{

    try{
      if(response.statusCode >= 200 && response.statusCode <= 210){
        kPrint("SuccessCode : ${response.statusCode}");
        kPrint("SuccessBody : ${response.body}");
        if(response.body.isNotEmpty){
          return jsonDecode(response.body);
        }else{
          return response.body;
        }

      }else if(response.statusCode==401){
        kPrint("Response Code : ${response.statusCode}");
        kPrint("Response body : ${response.body}");
        return response.body;
      }else if(response.statusCode==404){
        kPrint("Response Code : ${response.statusCode}");
        kPrint("Response body : ${response.body}");
        return response.body;
      }else if(response.statusCode==500){
        kPrint("Response Code : ${response.statusCode}");
        kPrint("Response body : ${response.body}");

        return response.body;
      }

    }on SocketException catch(_){
      throw "No Internet";
    }on FormatException catch(_){
    throw "Bad Response";
    }catch(e){
     kPrint(e);
     throw e.toString();

    }

  }

}





