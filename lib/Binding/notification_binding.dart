import 'package:get/get.dart';
import 'package:heath/controller%20/notification_controller.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }

}