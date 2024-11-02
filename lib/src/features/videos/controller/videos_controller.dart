import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';
import 'package:movie_app_demo/src/features/videos/model/movie_video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideosController extends GetxController{
  final int movieId;

  VideosController({required this.movieId});
  RxList<MovieVideosModel> videoList=<MovieVideosModel>[].obs;
  RxList<MovieModel> recommendedList=<MovieModel>[].obs;
  YoutubePlayerController? controller;
  RxBool isLoading=false.obs;

  late Rxn<PlayerState> _playerState;
  late Rxn<YoutubeMetaData> _videoMetaData;
   final RxBool _muted = false.obs;
  RxBool isPlayerReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
    fetchRecommendedMovies();
  }


  Future<void> fetchVideos()async{
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
          autoPlay: false,
          mute: false,
        ),
      )..addListener(listener);
    }
  }

  void listener() {
    if (isPlayerReady.value && _muted.value && controller!.value.isFullScreen) {

        _playerState.value = controller!.value.playerState;
        _videoMetaData.value = controller!.metadata;
    }
  }

  Future<void> fetchRecommendedMovies()async{

    try{

      var response = await ApiHandler.handleResponse(await ApiHandler.getRequest(apiUrl: ApiEndpoints.recommendedMovie(movieId: movieId)));

      if(response["results"]!=null){
        recommendedList.value=[];
        for(var movie in response["results"]){
          recommendedList.add(MovieModel.fromJson(movie));
        }
        kPrint("Recommended Movie check : $recommendedList");
      }else{
        return response;
      }

    }catch(e){
      kPrint("Error while fetching recommended movies $e");
      throw "Error while fetching recommended movies $e";
    }

  }


}