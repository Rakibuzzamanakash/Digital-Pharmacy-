import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heath/controller%20/productController.dart';
import 'package:heath/ui/views/screens/profile_details.dart';
import 'package:heath/ui/views/screens/bag_screen.dart';
import 'package:heath/ui/views/screens/home_screen.dart';
import 'package:heath/ui/views/screens/more_screen.dart';
import 'package:heath/ui/views/screens/notifications_screen.dart';
import 'package:heath/ui/views/screens/orders_screen.dart';
import 'package:heath/ui/views/screens/shortcuts_screen.dart';

import '../../controller /notification_controller.dart';

class BottonNavController extends StatefulWidget {
  const BottonNavController({super.key});

  @override
  State<BottonNavController> createState() => _BottonNavControllerState();
}

class _BottonNavControllerState extends State<BottonNavController> {

  NotificationController notificationController =
  Get.put(NotificationController());


  int _selectedInbox = 0;

  void __navigatorButtonBar(int index) {
    setState(() {
      _selectedInbox = index;
    });
  }

  final List<Widget> _page = [
    HomeScreen(),
    ShortcutScreen(),
    BagScreen(),
    OrderScreen(),
    NotificationScreen(),
    ProfileDeatils(),
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedInbox],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedInbox,
        onTap: __navigatorButtonBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 25.sp,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flash_on,
              size: 25.sp,
            ),
            label: "Shortcuts",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: 25.sp,
            ),
            label: "Bag",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_outlined,
              size: 25.sp,
            ),
            label: "Orders",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.notifications_outlined,
          //     size: 25.sp,
          //   ),
          //   label: "notifiations",
          // ),
          BottomNavigationBarItem(
            icon:notificationController.isDataLoading.value ? Badge(
              showBadge: true,
              padding: EdgeInsets.all(5),
              shape: BadgeShape.circle,
              badgeContent: Text(
              '',style: TextStyle(
                color: Colors.white
              ),
              ),
              animationType: BadgeAnimationType.scale,
              position: BadgePosition.topEnd(),
              child: Icon(
                Icons.notifications_outlined,
                size: 25.sp,
              ),
            ):Badge(
              showBadge: true,
              padding: EdgeInsets.all(5),
              shape: BadgeShape.circle,
              badgeContent: Text(
                  notificationController.notificationCount(),style: TextStyle(
                  color: Colors.white
              )
              ),
              animationType: BadgeAnimationType.scale,
              position: BadgePosition.topEnd(),
              child: Icon(
                Icons.notifications_outlined,
                size: 25.sp,
              ),
            ),
            label: "notifiations",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 25.sp,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
