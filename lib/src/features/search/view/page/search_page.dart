import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/search/controller/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<MovieSearchController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Movie"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController.searchController,
              onSubmitted: (query) => searchController.searchMovie(query),
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for a movie...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          Obx(() {
            if (searchController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (searchController.searchMovieList.isEmpty) {
              return Center(child: Text("No results found."));
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: searchController.searchMovieList.length,
                  itemBuilder: (context, index) {
                    final movie = searchController.searchMovieList[index];
                    return ListTile(
                      leading: SizedBox(
                        width: 50,
                        child: KCachedNetworkImage(
                          imgUrl:'${AppConstants.apiImagePath}${movie.posterPath}',
                        ),
                      ),
                      title: Text(movie.title ?? "No Title"),
                      subtitle: Text(
                          "Release Date: ${movie.releaseDate ?? "Unknown"}",
                      ),
                      onTap: () {
                        Get.toNamed(AppRoutes.movieDetails, arguments: movie);
                      },
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
