import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Model/notification_model.dart';
import 'package:http/http.dart' as http;

import '../Const/base_url.dart';

class NotificationController extends GetxController {
  final Box = GetStorage();
  final baseurl = BaseUrl.baseurl;
  RxInt notificationnumber = 0.obs;

  NotificationModel? notificationModel;
  var isDataLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getnotificationList();
    notificationCount();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}



  getnotificationList() async {
    try {
      isDataLoading(true);
      final token = await Box.read('token');
      http.Response response = await http
          .get(Uri.tryParse('${baseurl}api/notifications')!, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        notificationModel = NotificationModel.fromJson(data);
      } else {}
    } catch (e) {
      return e;
    } finally {
      isDataLoading(false);
    }
  }


  notificationCount() {
    if (notificationModel!.notifications!.length > 9) {
      return '9+';
    } else if (notificationModel!.notifications!.length < 1 ||
        notificationModel!.notifications == null) {
      return '0';
    } else {
      return notificationModel!.notifications!.length.toString();
    }
  }
}
