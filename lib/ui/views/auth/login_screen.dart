import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Const/colors.dart';
import 'package:heath/controller%20/helpline-call.dart';
import 'package:heath/controller%20/login_controller.dart';
import 'package:heath/ui/routes/route.dart';
import 'package:heath/ui/style/style.dart';
import 'package:heath/ui/views/screens/home_screen.dart';
import 'package:heath/ui/views/screens/profile_details.dart';
import 'package:heath/ui/views/widgets/password_input.dart';
import 'package:heath/ui/views/widgets/raounded_body.dart';
import 'package:heath/ui/views/widgets/textfiled_input.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  HelpLineCall helpLineCall = Get.put(HelpLineCall());

  final Box = GetStorage();

  LogIncontroller logIncontroller = Get.put(LogIncontroller());

  // void login(String email , password) async {
  //
  //   try{
  //     var response = await post(
  //       Uri.parse('https://dutchpharmalimited.com/api/user/login'),
  //       body: {
  //         'email' : email,
  //         'password' : password
  //       }
  //     );
  //
  //     if(response.statusCode == 200){
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Login successfully');
  //     }else {
  //       print('failed');
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  //
  // }

  // Future login() async {
  //   if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
  //     var response = await http.post(
  //         Uri.parse("https://dutchpharmalimited.com/api/user/login"),
  //         body: ({
  //           'phone': emailController.text,
  //           'password': passwordController.text
  //         }));
  //     if (response.statusCode == 201) {
  //       var data = jsonDecode(response.body.toString());
  //       await Box.write('token', data['token']);
  //       await Box.write('login', 'complete');
  //       await Box.write('id', data['user']['id'].toString());
  //       //print(data['token']);
  //      // print(data['user']);
  //       print(data['user']['id'].toString());
  //       print(Box.read('id'));
  //       Get.snackbar('Account', 'Successfully Login',
  //           snackPosition: SnackPosition.BOTTOM);
  //       Get.toNamed(bottonController);
  //       //print("Correct");
  //     //  print(Box.read('token'));
  //     } else {
  //       Get.snackbar('Alert', 'These user info do not match our records',
  //           snackPosition: SnackPosition.BOTTOM);
  //       print("Wronggooooooooooooooooooooooooooo");
  //     }
  //   } else {
  //     Get.snackbar('Warning', 'Blank field is not allowed',
  //         snackPosition: SnackPosition.BOTTOM);
  //     print('Blank field is not allowed');
  //   }
  //   // print(phoneController.text);eve.holt@reqres.in pistol
  //   // print(passwordController.text);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //title widget
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("assets/images/logo.png", width: 45.w),
              Text("Heath", style: style18(Colors.black)),
              Text("OS", style: style20(Colors.black)),
            ]),
            SizedBox(height: 5.h),
            Text(
              "Sign to continue",
            ),
            //textField widget
            SizedBox(height: 15.h),
            TextInputField(
              Controller: emailController,
              color: Colors.grey,
              hint: 'Email or Phone Number',
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),

            PasswordInput(
              Controller: passwordController,
              hint: 'Password',
              inputAction: TextInputAction.next,
            ),

            SizedBox(height: 10.h),
            //rounded widget
            InkWell(
              onTap: () {
                logIncontroller.login(passwordController.text, emailController.text);


              },
              child: RoundedButton(
                color: AppColors.roundedColor,
                buttonName: 'Login',
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black
                  ),
                ),
                InkWell(
                    onTap: () {
                      Get.toNamed(registration);
                    },
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                Get.toNamed(forgetScreen);
              },
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                helpLineCall.phonecall();
              },
              child: Text(
                "Call us",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
