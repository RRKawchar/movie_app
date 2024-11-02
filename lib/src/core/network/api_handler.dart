import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';

class ApiHandler{


  static Future<http.Response> getRequest({required String apiUrl})async{

    var headers={
      "Authorization":"",
      "Content-Type" : "application/json;charset=utf-8",
      "accept":"application/json"

    };
    kPrint("You hit : $apiUrl");
    http.Response response=await http.get(Uri.parse(apiUrl),headers:headers);

    return response;
  }


  static Future<http.Response> postRequest({required String apiUrl, required dynamic body})async{

    Map<String,String> headers={
      'accept' : 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };
    kPrint("You hit : $apiUrl");
    http.Response response=await http.post(Uri.parse(apiUrl),headers:headers, body: body);

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





