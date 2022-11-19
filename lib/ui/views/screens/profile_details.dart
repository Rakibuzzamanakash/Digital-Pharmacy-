import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/controller%20/helpline-call.dart';
import 'package:heath/controller%20/user_controller.dart';
import 'package:heath/ui/routes/route.dart';
import 'package:heath/ui/style/style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Const/base_url.dart';

class ProfileDeatils extends StatelessWidget {

  HelpLineCall helpLineCall = Get.put(HelpLineCall());
  UserController userController = Get.put(UserController());
  String _baseUrl = BaseUrl.baseurl;
  final Box = GetStorage();

  logout() async {
    await Box.remove('token');
    Get.toNamed(loginScreen);
    Get.snackbar('Alert', 'You logout from this app',
        duration: Duration(seconds: 3), snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 242, 242),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 20.sp,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 60.h,
          elevation: 0,
          backgroundColor: Color.fromARGB(179, 247, 245, 245),
        ),
        body: userController.isDataLoading.value ?
            Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150.h,
                width: double.infinity.w,
                child: Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 110.h,
                              width: 110.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: NetworkImage('${_baseUrl}${userController.userModel!.userProfile!.profile.toString()}')
                                )
                              ),
                              // child: userController.userModel!.userProfile!.profile.toString() == null?
                              // Center(child: CircularProgressIndicator(),)
                              // :Image.network(userController.userModel!.userProfile!.profile.toString()),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userController.userModel!.userProfile!.name.toString(),
                                    style: style18(Colors.black)),
                                SizedBox(height: 3.h),
                                Text(
                                  userController.userModel!.userProfile!.email.toString(),
                                  style: style12(Colors.black),
                                ),
                                Text(
                                  userController.userModel!.userProfile!.pharmacyAddress.toString(),
                                  style: style12(Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              settingsBar(
                  name: 'SETTINGS',
                  icon: Icons.settings_outlined, onAction: () {
                    Get.toNamed(profileUpdatescreen);
              },),
              settingsBar(
                  name: 'PASSWORD CHANGE',
                  icon: Icons.password_outlined,
                onAction: () {
                Get.toNamed(updateScreen);
              },),
              settingsBar(
                   name: 'HELPLINE', icon: Icons.call_outlined, onAction: () {
                helpLineCall.phonecall();
                print('object');
              },),
              Padding(
                padding: EdgeInsets.only(top: 210.h),
                child: Column(
                  children: [
                    Text("Version 1.17.0"),
                    SizedBox(height: 10.h),
                    Container(
                      height: 1.h,
                      width: double.infinity.w,
                      color: Color.fromARGB(255, 238, 10, 67),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: InkWell(
                        onTap: () {
                          logout();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("LOGOUT", style: style12(Colors.red)),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 20.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class settingsBar extends StatelessWidget {
  final String name;
  final icon;
  final onTab;
  Function() onAction;
   settingsBar({
    Key? key,
    required this.name,
    required this.onAction,
    this.icon,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAction();
      },
      child: Container(
        height: 70.h,
        width: double.infinity.w,
        child: Card(
          elevation: 0.3,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: style12(Colors.black)),
                Icon(icon, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
