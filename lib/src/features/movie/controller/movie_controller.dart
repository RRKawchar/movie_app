import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';


class MovieController extends GetxController{

  RxList<MovieModel> popularMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovie();
  }



  Future<void> fetchMovie()async{
    try{
      var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(apiUrl: ApiEndpoints.popularMovie));
      if(response !=null){
        popularMovies.value=[];
        for(var result in response['results']){
          popularMovies.add(MovieModel.fromJson(result));
        }
      }
    }catch(e){
      kPrint(e);
      throw e.toString();
    }
  }

}