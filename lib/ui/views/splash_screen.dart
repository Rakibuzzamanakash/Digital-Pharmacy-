import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Const/colors.dart';

import '../routes/route.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
 
  final Box = GetStorage();
  
 pageNavigate() async{
 final login =await Box.read('token');

 if(login == null){
     return Get.toNamed(loginScreen);
 }else{
     return Get.toNamed(bottonController);
 }
 }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () => pageNavigate());
    return Scaffold(
      body: Center(
        child: CircleAvatar(backgroundColor: AppColors.roundedColor),
      ),
    );
  }
}
