import 'dart:async';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/enums/app_enums.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/service/auth_service.dart';
import 'package:movie_app_demo/src/core/service/local_storage_service.dart';
import 'package:movie_app_demo/src/features/home/view/page/home_page.dart';
import 'package:uni_links2/uni_links.dart';

class AuthController extends GetxController{

  RxnString sessionId = RxnString(null);
  Rxn<Uri> initialUri = Rxn<Uri>();
  StreamSubscription? streamSubscription;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkExistingSession();
    _handleIncomingLinks();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    super.onClose();
  }

  Future<void> _checkExistingSession() async {
    final savedSessionId = await LocalStorageService.getSavedSession(key: LocalStorageKey.sessionId);
    if (savedSessionId != null) {
      sessionId.value = savedSessionId;
      kPrint("CheckExistingSession Id : ${sessionId.value}");
      Get.toNamed(AppRoutes.homePage);
    }
  }

  void _handleIncomingLinks() {
    streamSubscription = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        initialUri.value = uri;
        _processDeepLink();
      }
    }, onError: (Object err) {
      kPrint('Error occurred while listening to deep link: $err');
    });

    getInitialUri().then((Uri? uri) {
      initialUri.value = uri;
      _processDeepLink();
    }).catchError((err) {
      kPrint('Failed to receive initial deep link: $err');
    });
  }

  void _processDeepLink() async {
    if (initialUri.value != null) {
      final requestToken = initialUri.value?.queryParameters['request_token'];
      if (requestToken != null) {
        final createdSessionId = await AuthService.createSession(requestToken);
        if (createdSessionId != null) {
          await LocalStorageService.saveSession(key: LocalStorageKey.sessionId,data: createdSessionId);
          sessionId.value = createdSessionId;
          kPrint("processDeep Link session Id : ${sessionId.value}");
          Get.toNamed(AppRoutes.homePage);
        }
      }
    }
  }

  Future<void> handleLogin() async {
    try{
      isLoading.value=true;

      final requestToken = await AuthService.getRequestToken();
      if (requestToken != null) {
        final success = await AuthService.redirectToLogin(requestToken);
        if (!success) {
          kPrint('Failed to redirect to login');
        }else{
          kPrint('Failed to fetch to request token');
        }
      }
    }catch(e){
      kPrint("Error while handle login :$e");
      Get.snackbar('Error', 'An unexpected error occurred during login');
      throw "Error while handle login :$e";

    }finally{
      isLoading.value=false;
    }
  }




}