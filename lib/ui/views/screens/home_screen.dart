
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heath/Const/base_url.dart';
import 'package:heath/controller%20/productController.dart';
import 'package:heath/controller%20/slider_controller.dart';
import 'package:heath/Const/colors.dart';
import 'package:heath/ui/style/style.dart';
import 'package:heath/ui/views/widgets/card_discount.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

   SliderController sliderController = Get.put(SliderController());
   ProductController productController = Get.put(ProductController());
   String _baseUrl = BaseUrl.baseurl;

// output:  Aug, Fri, 2021

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.arrow_upward),
      //   onPressed: (){
      //   },
      // ),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80.h,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarColor,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 30.w),
            Text(
              "Heath",
              style: style18(Colors.black),
            ),
            Text(
              "OS",
              style: style20(Colors.black),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.witheColor,
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 5.w),
          CircleAvatar(
            backgroundColor: AppColors.witheColor,
            child: Icon(Icons.security, color: Colors.grey),
          ),
          SizedBox(width: 5.w),
          CircleAvatar(
            backgroundColor: AppColors.witheColor,
            child: Icon(Icons.menu_book_rounded, color: Colors.grey),
          ),
          SizedBox(width: 5.w),
          CircleAvatar(
            backgroundColor: AppColors.witheColor,
            child: Icon(Icons.menu, color: Colors.grey),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      body:  SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            children: [

              Container(
                height: 140,
                child: Obx(() => sliderController.isDataLoading.value ?
                Container(height: 140,child: Center(child: CircularProgressIndicator(),),)
             : CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            height: 140.h,
                            onPageChanged:
                                (currentIndex, customPageChangedReason) {
                              sliderController.currentIndex.value = currentIndex;
                            }),
                        // pauseAutoPlayOnTouch: Duration(seconds: 5),
                        // height: MediaQuery.of(context).size.height * 0.60,
                        items: <Widget>[
                          for (var i = 0;
                          i < sliderController.sliderImgModel!.slider!.length;
                          i++)
                            Container(
                              margin:
                              const EdgeInsets.only(left: 5.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('${_baseUrl}${sliderController.sliderImgModel!.slider![i].sliderImage.toString()}'),
                                  fit: BoxFit.cover,
                                ),
                                border:
                                Border.all(color: Theme.of(context).accentColor),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                        ],
                      )
                ),
              ),



                CardDiscount(),
              // ItemsList(),
            ],
          ),
        ),
      ),
    );
  }
}


