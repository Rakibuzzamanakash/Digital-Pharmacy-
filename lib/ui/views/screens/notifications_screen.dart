import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heath/Const/base_url.dart';
import 'package:heath/controller%20/notification_controller.dart';
import 'package:heath/ui/routes/route.dart';
import 'package:heath/ui/views/details/notification_details.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  NotificationController notificationController =
      Get.put(NotificationController());
//  String _baseUrl = BaseUrl.baseurl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 233, 233),
        appBar: AppBar(
          toolbarHeight: 70.h,
          automaticallyImplyLeading: false,
          elevation: 0.3,
          backgroundColor: Color.fromARGB(255, 248, 246, 246),
          title: Text(
            "Notifications",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Center(
              child: Text(
                "MARK ALL AS READ",
                style: TextStyle(fontSize: 10.sp, color: Colors.black87),
              ),
            ),
            SizedBox(width: 15.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => notificationController.isDataLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                  height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: notificationController
                                .notificationModel!.notifications!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                       // print(notificationController.notificationModel!.notifications!.length.toString());
                                        Get.toNamed(
                                            notificationdetails,
                                            arguments: NotificationDetails(
                                                title: notificationController.notificationModel!.notifications![index].title.toString(),
                                                comment:  notificationController.notificationModel!.notifications![index].comments.toString()
                                            ),
                                        );
                                      } ,
                                      child: Card(
                                        elevation: 0.3,
                                        child: Padding(
                                          padding:  EdgeInsets.all(8.0),
                                          child: Column(

                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    notificationController.notificationModel!.notifications![index].title.toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 11.sp),
                                                  ),

                                                  Text(
                                                    notificationController.notificationModel!.notifications![index].status.toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 9.sp),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 3.h),
                                              Container(
                                                width: MediaQuery.of(context).size.width * .7,
                                                child: Text(
                                                  notificationController.notificationModel!.notifications![index].comments.toString(),
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10.sp),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
              )

              // Padding(
              //   padding:
              //   EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.h),
              //   child: Column(
              //     children: [
              //       // for (int i = 1; i < 100; i++)
              //       Container(
              //         height: 100.h,
              //         width: double.infinity.w,
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(5.r),
              //         ),
              //         child: Card(
              //           elevation: 0.3,
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               SizedBox(width: 1.w),
              //               Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     notificationController.notificationModel.notifications[,
              //                     style: TextStyle(
              //                         color: Colors.grey, fontSize: 11.sp),
              //                   ),
              //                   SizedBox(height: 3.h),
              //                   Text(
              //                     " সংস্কৃতি",
              //                     style: TextStyle(
              //                         color: Colors.grey, fontSize: 11.sp),
              //                   ),
              //                   SizedBox(height: 3.h),
              //                   Text(
              //                     " দেশ বাংলাদেশ এর ব্যাপারে কিছু ব্যাপারে কিছু ব্যাপারে  ...",
              //                     style: TextStyle(
              //                         color: Colors.grey, fontSize: 10.sp),
              //                   ),
              //                 ],
              //               ),
              //               Padding(
              //                 padding:
              //                 EdgeInsets.only(right: 15.w, top: 30.h),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.end,
              //                   children: [
              //                     Text(
              //                       "9 hours ago",
              //                       style: TextStyle(
              //                           color: Colors.grey, fontSize: 9.sp),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
