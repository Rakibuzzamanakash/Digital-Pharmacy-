import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Const/colors.dart';
import 'package:heath/ui/routes/route.dart';
import 'package:heath/ui/views/widgets/header_text.dart';
import 'package:heath/ui/views/widgets/password_input.dart';
import 'package:heath/ui/views/widgets/raounded_body.dart';
import 'package:heath/ui/views/widgets/textfiled_input.dart';
import 'package:http/http.dart' as http;

import '../../style/style.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController confirmpasswordController = TextEditingController();

   final Box = GetStorage();

   Future register() async {
     if (passwordController.text.isNotEmpty && confirmpasswordController.text.isNotEmpty && phoneController.text.isNotEmpty && nameController.text.isNotEmpty) {
       if(passwordController.text != confirmpasswordController.text){
         Get.snackbar('Error', 'password not matched',
             snackPosition: SnackPosition.BOTTOM);
       }else{
         var response = await http.post(
             Uri.parse("https://dutchpharmalimited.com/api/user/register"),
             body: ({
               'name': nameController.text,
               'phone': phoneController.text,
               'password': passwordController.text
             }));
         var data = jsonDecode(response.body.toString());
         if (response.statusCode == 201) {
             print(data['message']);
             Get.snackbar('Alert', data['message'],
                 snackPosition: SnackPosition.BOTTOM);
           }else if(response.statusCode == 200){
             await Box.write('token', data['token']);
             await Box.write('login', 'complete');
             await Box.write('id', data['user_id'].toString());
             print(data['token']);
             print(data['message']);
             Get.snackbar('Account', data['message'],
                 snackPosition: SnackPosition.BOTTOM);
             Get.toNamed(bottonController);
             print("Correct");
             print(Box.read('token'));
           }

         }
         // else {
         //   Get.snackbar('Alert', 'Phone Already Taken',
         //       snackPosition: SnackPosition.BOTTOM);
         //   print("Wronggooooooooooooooooooooooooooo");
         // }
       }

      else {
       Get.snackbar('Warning', 'Blank field is not allowed',
           snackPosition: SnackPosition.BOTTOM);
       print('Blank field is not allowed');
     }
     // print(phoneController.text);eve.holt@reqres.in pistol
     // print(passwordController.text);
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //title widget
              HeaderText(
                text: 'Welcome',
                subText: 'Sign to continue',
              ),

              SizedBox(height: 10.h),
              //textField widget
              TextInputField(
                color: Colors.grey,
                Controller: nameController,
                hint: 'Name *',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),
              TextInputField(
                color: Colors.grey,
                Controller: phoneController,
                hint: 'Phone *',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),


              PasswordInput(
                Controller: passwordController,
                hint: 'Password *',
                inputAction: TextInputAction.next,
              ),

              PasswordInput(
                Controller: confirmpasswordController,
                hint: 'Confirm Password *',
                inputAction: TextInputAction.next,
              ),

              SizedBox(height: 20.h,),

              InkWell(
                onTap: () {
                  register();
                },
                child: RoundedButton(
                  color: AppColors.roundedColor,
                  buttonName: 'Register',
                ),
              ),
              
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  TextButton(
                      onPressed: ()=> Get.toNamed(loginScreen),
                      child:  Text('Login Now',style: TextStyle(
                        color: Colors.black
                      ),),),
                 
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
