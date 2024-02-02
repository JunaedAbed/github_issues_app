import 'package:get/get.dart';
import 'package:github_issues_app/data/api/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GetConnect>(GetConnect());
    Get.put<ApiClient>(ApiClient());
  }
}
