import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/enums/app_enums.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/service/local_storage_service.dart';
import 'package:movie_app_demo/src/features/account/model/account_model.dart';

class AccountController extends GetxController {
  Rx<AccountModel> accountList = AccountModel().obs;
  RxnString sessionId=RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchSessionId();
  }

  fetchSessionId() async {
    sessionId.value = await LocalStorageService.getSavedSession(
        key: LocalStorageKey.sessionId);
    kPrint("My SessionId2 $sessionId");

    if (sessionId.value !=null) {
     await fetchAccountData();
    } else {
      kPrint("Session ID is null. Handle this case appropriately.");
    }
  }

  Future<void> fetchAccountData() async {
    try {
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.getAccountId(
            sessionId: sessionId.value.toString(),
          ),
        ),
      );

      if (response != null) {
        accountList.value = AccountModel.fromJson(response);
      } else {
        return response;
      }
    } catch (e) {
      kPrint("Error while fetching account data :$e");
      throw "Error while fetching account data :$e";
    }
  }
}
