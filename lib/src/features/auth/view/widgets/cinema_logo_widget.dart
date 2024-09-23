import 'package:flutter/material.dart';
import 'package:movie_app_demo/src/core/utils/assets_path.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';

class CinemaLogoWidget extends StatelessWidget {
  const CinemaLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 170,
          width: 170,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: kTextColor,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: kTextColor,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AssetsPath.cinemaIcon)
                )
            ),

          ),
        )
      ],
    );
  }
}
