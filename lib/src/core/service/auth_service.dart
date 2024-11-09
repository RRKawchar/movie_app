import 'dart:convert';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthService {
  static Future<String?> getRequestToken() async {
    try {
      Map<String,String> queryParams={
        "api_key":apiKey
      };
      var response = await ApiHandler.handleResponse(
          await ApiHandler.getRequest(apiUrl: ApiEndpoints.getRequestTokenApi,queryParams: queryParams));
      if (response['request_token'] != null) {
        return response['request_token'];
      } else {
        return response;
      }
    } catch (e) {
      kPrint("Error while get request token $e");
      throw "Error while get request token $e";
    }
  }

  static Future<bool> redirectToLogin(String requestToken) async {
    final authUrl = ApiEndpoints.redirectToLogin(requestToken: requestToken);
    if (await canLaunch(authUrl)) {
      await launch(authUrl);
      return true;
    } else {
      kPrint('Could not launch URL');
      return false;
    }
  }

  static Future<String?> createSession(String requestToken) async {
    try{

      Map<String, dynamic> body = {
        'request_token': requestToken,
      };

      final response = await ApiHandler.handleResponse(
        await ApiHandler.postRequest(
          apiUrl: ApiEndpoints.createSessionApi,
          queryParams: {
            "api_key":apiKey,
          },
          body: jsonEncode(body),
        ),
      );

      if(response['session_id']!=null){
        return response['session_id'];
      }else{
        return response;
      }

    }catch(e){
      kPrint("Error while create session $e");
      throw "Error while create session $e";
    }

  }

}
