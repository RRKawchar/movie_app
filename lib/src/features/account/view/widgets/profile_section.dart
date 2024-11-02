import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/assets_path.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/account/controller/account_controller.dart';

class ProfileSection extends StatelessWidget {
  final AccountController accountController;
  const ProfileSection({
    super.key,
    required this.accountController,
  });

  @override
  Widget build(BuildContext context) {
    final account = accountController.accountList;
    return Obx(
      () => account.value.id == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 150, AssetsPath.movieIllustrations),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: KCachedNetworkImage(
                    imgUrl:
                        "${AppConstants.apiImagePath}${account.value.avatarPath}",
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${account.value.username}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${account.value.id}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
