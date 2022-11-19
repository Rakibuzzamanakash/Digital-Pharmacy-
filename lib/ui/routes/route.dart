
import 'package:get/get.dart';
import 'package:heath/Binding/home_binding.dart';
import 'package:heath/Binding/notification_binding.dart';
import 'package:heath/Binding/poductcart_binding.dart';
import 'package:heath/ui/views/auth/forget_screen.dart';
import 'package:heath/ui/views/auth/login_screen.dart';
import 'package:heath/ui/views/auth/register_screen.dart';
import 'package:heath/ui/views/auth/update_screen.dart';
import 'package:heath/ui/views/button_navi_controller.dart';
import 'package:heath/ui/views/details/item_list_details.dart';
import 'package:heath/ui/views/details/notification_details.dart';
import 'package:heath/ui/views/screens/home_screen.dart';
import 'package:heath/ui/views/screens/profile_details.dart';
import 'package:heath/ui/views/screens/profile_update_screen.dart';

import 'package:heath/ui/views/splash_screen.dart';
import 'package:heath/ui/views/widgets/card_discount.dart';

import '../views/screens/notifications_screen.dart';

const String splash = '/splash_screen';
const String homeScreen = '/home_screen';
const String registration = '/registration_screen';
const String updateScreen = '/update_screen';
const String bottonController = '/botton_Controller';
const String forgetScreen = '/forget_Screen';
const String loginScreen = '/login_screen';
const String itemListDetails = '/itemList_Details';
const String productcart = '/productcart_Details';
const String notification = '/notification_screen';
const String notificationdetails = '/notificationdetails_screen';
const String profileUpdatescreen = '/profileUpdate_screen';
const String profiledetailsscreen = '/profiledetails_screen';
//contrat our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),
  GetPage(name: homeScreen, page: () => HomeScreen(), binding: HomeBinding()),
  GetPage(name: notification, page: () => NotificationScreen(), binding: NotificationBinding()),
  GetPage(name: notificationdetails, page: () {
    NotificationDetails _addNotificationdetailsinfo = Get.arguments;
    return _addNotificationdetailsinfo;
  }, binding: NotificationBinding()),
  GetPage(name: registration, page: () => RegisterScreen()),
  GetPage(name: updateScreen, page: () => UpdateScreen()),
  GetPage(name: bottonController, page: () => BottonNavController()),
  GetPage(name: forgetScreen, page: () => ForgetScreen()),
  GetPage(name: loginScreen, page: () => LoginScreen()),
  GetPage(name: itemListDetails, page: () => ItemListDetails()),
  GetPage(name: productcart, page: () => CardDiscount(), binding: ProductcartBinding()),
  GetPage(name: profileUpdatescreen, page: () => ProfileUpdate()),
  GetPage(name: profiledetailsscreen, page: () => ProfileDeatils()),
];
