// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:movie_app_demo/src/core/helper/helper_method.dart';
//
// class RatingWidgets extends StatelessWidget {
//   const RatingWidgets({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar.builder(
//       initialRating: 3,
//       minRating: 1,
//       direction: Axis.horizontal,
//       allowHalfRating: true,
//       itemCount: 5,
//       unratedColor: Colors.grey,
//       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//       itemBuilder: (context, _) => const Icon(
//         Icons.star,
//         color: Colors.amber,
//       ),
//       onRatingUpdate: (rating) {
//         kPrint(rating);
//       },
//     );
//   }
// }
