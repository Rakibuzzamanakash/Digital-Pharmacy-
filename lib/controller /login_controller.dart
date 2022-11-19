import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../ui/routes/route.dart';
class LogIncontroller extends GetxController{

  final Box = GetStorage();
  RxList data = [].obs;


  @override
  void onInit() {
    super.onInit();
  }
  Future login(String password,String email) async {
    if (password.isNotEmpty && email.isNotEmpty) {
      var response = await http.post(
          Uri.parse("https://dutchpharmalimited.com/api/user/login"),
          body: ({
            'phone': email,
            'password': password
          }));
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        await Box.write('token', data['token']);
        await Box.write('login', 'complete');
        //print(data['token']);
        // print(data['user']);
        print(data['user']['id'].toString());
        print(Box.read('id'));
        Get.snackbar('Account', 'Successfully Login',
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(bottonController);
        //print("Correct");
        //  print(Box.read('token'));
      } else {
        Get.snackbar('Alert', 'These user info do not match our records',
            snackPosition: SnackPosition.BOTTOM);
        print("Wronggooooooooooooooooooooooooooo");
      }
    } else {
      Get.snackbar('Warning', 'Blank field is not allowed',
          snackPosition: SnackPosition.BOTTOM);
      print('Blank field is not allowed');
    }
    // print(phoneController.text);eve.holt@reqres.in pistol
    // print(passwordController.text);
  }
}