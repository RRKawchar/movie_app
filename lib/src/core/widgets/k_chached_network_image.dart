import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:movie_app_demo/src/core/extensions/build_context_extensions.dart';
import 'package:movie_app_demo/src/core/utils/assets_path.dart';

class KCachedNetworkImage extends StatelessWidget {
  final String imgUrl;
  final Color? colorFilter;
  const KCachedNetworkImage({
    super.key,
    required this.imgUrl,
    this.colorFilter,

  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              colorFilter??Colors.transparent,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => SizedBox(
        height: context.height,
        width: context.width,
        child:Image.asset(AssetsPath.movieIllustrations)
      ),
    );
  }
}
