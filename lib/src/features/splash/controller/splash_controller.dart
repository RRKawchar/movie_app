import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/enums/app_enums.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/service/local_storage_service.dart';

class SplashController extends GetxController{
  RxnString sessionId = RxnString(null);

  @override
  void onInit() {
    super.onInit();
    navigateNext();
    Future.delayed(Duration(seconds: 3),(){
      navigateNext();
    });
  }



  void navigateNext()async{

    final savedSessionId = await LocalStorageService.getSavedSession(key: LocalStorageKey.sessionId);
    if (savedSessionId != null) {
      sessionId.value = savedSessionId;
      Get.offNamed(AppRoutes.homePage);

    }else{
      Get.offNamed(AppRoutes.authPage);

    }

  }


}