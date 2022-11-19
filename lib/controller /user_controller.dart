import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Model/user_model.dart';
import 'package:http/http.dart' as http;
import '../Const/base_url.dart';

class UserController extends GetxController{

  final Box = GetStorage();
  final baseurl = BaseUrl.baseurl;

  UserModel? userModel;
  var isDataLoading = false.obs;

  void onInit() async {
    getUserInfo();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getUserInfo() async {
    try {
      isDataLoading(true);
      final token = await Box.read('token');
      final id = await Box.read('id');
      http.Response response = await http.get(
          Uri.tryParse('${baseurl}api/user/profile/$id')!,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        userModel = UserModel.fromJson(data);
      } else {
        // return SliderImgModel.fromJson(data);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

}