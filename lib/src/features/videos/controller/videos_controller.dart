import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/features/videos/model/movie_video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosController extends GetxController{
  final int movieId;

  VideosController({required this.movieId});
  RxList<MovieVideosModel> videoList=<MovieVideosModel>[].obs;
  YoutubePlayerController? controller;


  @override
  void onInit() {
    super.onInit();
    fetchVideos();

  }


  fetchVideos()async{
    try{

      var response =await ApiHandler.handleResponse(await ApiHandler.getRequest(apiUrl: ApiEndpoints.moviesVideos(movieId: movieId)));
      if(response !=null){
        videoList.value=[];
        for(var videos in response['results']){
          videoList.add(MovieVideosModel.fromJson(videos));
        }
      }

    }catch(e){
      kPrint("Error while fetching videos $e");
      throw "Error while fetching videos $e";
    }
  }


  void initializePlayer(String videoUrl) {
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId != null) {
      controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    }
  }
}