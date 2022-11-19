import 'package:get/get.dart';
import 'package:heath/controller%20/user_controller.dart';

class UserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }

}