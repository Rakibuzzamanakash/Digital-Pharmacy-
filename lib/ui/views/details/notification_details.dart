import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationDetails extends StatelessWidget {
  String title;
  String comment;
   NotificationDetails({
    required this.title,
     required this.comment
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back,color: Colors.black),),
        title: Text(
          "Notifications",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp),),
              SizedBox(height: 15.h,),
              Text(
                comment,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
