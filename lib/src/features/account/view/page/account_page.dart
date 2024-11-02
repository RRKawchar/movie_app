import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/features/account/controller/account_controller.dart';
import 'package:movie_app_demo/src/features/account/view/widgets/profile_section.dart';
import 'package:movie_app_demo/src/features/favorite/view/page/favorite_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.put(AccountController());
    final account = accountController.accountList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Details",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(accountController: accountController),
            SizedBox(height: 8),
            ListTile(
              onTap: (){
                Get.to(()=>FavoritePage());
              },
              leading: Icon(Icons.favorite_border),
              title: Text("Favorite"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.video_collection),
              title: Text("WatchList"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: Text("Download"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Obx(
                () => account.value.language == null
                    ? Text("Language")
                    : Text("Language  : ${account.value.language ?? ""}"),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.countertops),
              title: Obx(
                () => account.value.country == null
                    ? Text("Country")
                    : Text("Country  : ${account.value.country ?? ""}"),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
