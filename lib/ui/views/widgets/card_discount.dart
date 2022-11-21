import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heath/controller%20/productController.dart';
import 'package:heath/Const/colors.dart';
import 'package:heath/ui/model/discount_list.dart';
import 'package:heath/ui/routes/route.dart';
import 'package:heath/ui/style/style.dart';
import 'package:intl/intl.dart';

import '../../../Const/base_url.dart';
import '../../../controller /slider_controller.dart';

class CardDiscount extends GetView<ProductController> {
  final ontab;
  CardDiscount({super.key, this.ontab});
  SliderController sliderController = Get.put(SliderController());
  //String _baseUrl = BaseUrl.baseurl;

  final ProductController _productController = Get.put(ProductController());
  String _baseUrl = BaseUrl.baseurl;
  String _date =
      DateFormat("EEE, d MMM").format(DateTime.now().add(Duration(days: 1)));

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isDataProcessing.value == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (controller.lstTask.length > 0) {
          return Container(
            height: MediaQuery.of(context).size.height*9,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: controller.scrollController,
                    itemCount: controller.lstTask.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == controller.lstTask.length - 1 &&
                          controller.isMoreDataAvailable.value == true) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Card(
                            child: Container(
                              height: 110.h,
                              decoration: BoxDecoration(color: Colors.white70),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${_baseUrl}${controller.lstTask[index]["ProductImage"].toString()}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 55.h,
                                              width: 270.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                          '${controller.lstTask[index]["categories"]['category_name'].toString()}'
                                                          // _productController
                                                          //     .productModel!
                                                          //     .products![index]
                                                          //     .categories!
                                                          //     .categoryName
                                                          //     .toString(),
                                                        ,
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              color:
                                                              Colors.grey)),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 5.h),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .delivery_dining,
                                                                color: AppColors
                                                                    .roundedColor,
                                                                size: 18.sp),
                                                            SizedBox(width: 3.w),
                                                            Text("Delivery",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    8.sp)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 30.h,
                                                        width: 170.w,
                                                        child: Text(
                                                            '${controller.lstTask[index]["ProductName"].toString()}'
                                                            // _productController
                                                            //     .productModel!
                                                            //     .products![index]
                                                            //     .productName
                                                            //     .toString(),
                                                          ,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                      ),
                                                      Text(
                                                        _date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 11.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30.h,
                                              width: 270.w,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '${controller.lstTask[index]["ProductSalePrice"].toString()}',
                                                    // _productController
                                                    //     .productModel!
                                                    //     .products![index]
                                                    //     .productSalePrice
                                                    //     .toString(),
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Text(
                                                    '${controller.lstTask[index]["ProductRegularPrice"].toString()}'
                                                    // _productController
                                                    //     .productModel!
                                                    //     .products![index]
                                                    //     .productRegularPrice
                                                    //     .toString(),
                                                    ,
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 10.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Expanded(child: Container()),
                                                  Container(
                                                    width: 100.h,
                                                    height: 30.w,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .BackgroudColor,
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.r)),
                                                    ),
                                                    child: TextButton(
                                                        onPressed: () {},
                                                        child: Text("Add To Bag",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: Colors
                                                                    .black))),
                                                  ),
                                                ],
                                              ),
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
                        );



                      //   Column(
                      //   children: [
                      //     Container(
                      //       height: 40,
                      //       width: 40,
                      //       decoration: BoxDecoration(
                      //           color: Colors.blueGrey,
                      //           image: DecorationImage(
                      //               image: NetworkImage(
                      //                   '${_baseUrl}${controller.lstTask[index]["ProductImage"].toString()}'),
                      //               fit: BoxFit.cover)),
                      //       child: Text(controller.lstTask[index]["id"].toString()),
                      //     ),
                      //   ],
                      // );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              'Data not found',
              style: TextStyle(fontSize: 25),
            ),
          );
        }
      }
    }
    );




    //   Padding(
    //   padding: EdgeInsets.only(top: 12.h),
    //   child: Column(
    //     children: [
    //       Obx(
    //         () => _productController.isDataloading.value
    //             ? Center(
    //                 child: CircularProgressIndicator(),
    //               )
    //             : ListView.builder(
    //                 shrinkWrap: true,
    //                 physics: NeverScrollableScrollPhysics(),
    //                 scrollDirection: Axis.vertical,
    //                 itemCount:
    //                     _productController.productModel!.products!.length,
    //                 itemBuilder: (context, index) {
    //                   String _image =
    //                       '${_baseUrl}${_productController.productModel!.products![index].productImage.toString()}';
    //                   return Padding(
    //                     padding: EdgeInsets.symmetric(vertical: 5.h),
    //                     child: Card(
    //                       child: Container(
    //                         height: 110.h,
    //                         decoration: BoxDecoration(color: Colors.white70),
    //                         child: Padding(
    //                           padding: EdgeInsets.all(10.0),
    //                           child: Row(
    //                             children: [
    //                               Container(
    //                                 height: 50.h,
    //                                 width: 50.w,
    //                                 decoration: BoxDecoration(
    //                                   image: DecorationImage(
    //                                       image: NetworkImage(
    //                                         '${_baseUrl}${_productController.productModel!.products![index].productImage.toString()}'==null?
    //                                         "":
    //                                           '${_baseUrl}${_productController.productModel!.products![index].productImage.toString()}'),
    //                                       fit: BoxFit.cover),
    //                                 ),
    //                               ),
    //                               Expanded(child: Container()),
    //                               Column(
    //                                 children: [
    //                                   Row(
    //                                     children: [
    //                                       Container(
    //                                         height: 55.h,
    //                                         width: 270.w,
    //                                         child: Column(
    //                                           crossAxisAlignment:
    //                                               CrossAxisAlignment.start,
    //                                           children: [
    //                                             Row(
    //                                               mainAxisAlignment:
    //                                                   MainAxisAlignment
    //                                                       .spaceBetween,
    //                                               children: [
    //                                                 Text(
    //                                                     _productController
    //                                                         .productModel!
    //                                                         .products![index]
    //                                                         .categories!
    //                                                         .categoryName
    //                                                         .toString(),
    //                                                     style: TextStyle(
    //                                                         fontSize: 10.sp,
    //                                                         color:
    //                                                             Colors.grey)),
    //                                                 Padding(
    //                                                   padding: EdgeInsets.only(
    //                                                       top: 5.h),
    //                                                   child: Row(
    //                                                     children: [
    //                                                       Icon(
    //                                                           Icons
    //                                                               .delivery_dining,
    //                                                           color: AppColors
    //                                                               .roundedColor,
    //                                                           size: 18.sp),
    //                                                       SizedBox(width: 3.w),
    //                                                       Text("Delivery",
    //                                                           style: TextStyle(
    //                                                               fontSize:
    //                                                                   8.sp)),
    //                                                     ],
    //                                                   ),
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                             Row(
    //                                               mainAxisAlignment:
    //                                                   MainAxisAlignment
    //                                                       .spaceBetween,
    //                                               children: [
    //                                                 Container(
    //                                                   height: 30.h,
    //                                                   width: 170.w,
    //                                                   child: Text(
    //                                                       _productController
    //                                                           .productModel!
    //                                                           .products![index]
    //                                                           .productName
    //                                                           .toString(),
    //                                                       overflow: TextOverflow
    //                                                           .ellipsis,
    //                                                       style: TextStyle(
    //                                                           fontSize: 13.sp,
    //                                                           fontWeight:
    //                                                               FontWeight
    //                                                                   .w500)),
    //                                                 ),
    //                                                 Text(
    //                                                   _date.toString(),
    //                                                   style: TextStyle(
    //                                                       fontSize: 11.sp),
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Expanded(child: Container()),
    //                                   Row(
    //                                     children: [
    //                                       Container(
    //                                         height: 30.h,
    //                                         width: 270.w,
    //                                         child: Row(
    //                                           children: [
    //                                             Text(
    //                                               _productController
    //                                                   .productModel!
    //                                                   .products![index]
    //                                                   .productSalePrice
    //                                                   .toString(),
    //                                               style: TextStyle(
    //                                                 fontSize: 12.sp,
    //                                                 fontWeight: FontWeight.w500,
    //                                               ),
    //                                             ),
    //                                             SizedBox(
    //                                               width: 10.w,
    //                                             ),
    //                                             Text(
    //                                               _productController
    //                                                   .productModel!
    //                                                   .products![index]
    //                                                   .productRegularPrice
    //                                                   .toString(),
    //                                               style: TextStyle(
    //                                                 decoration: TextDecoration
    //                                                     .lineThrough,
    //                                                 fontSize: 10.sp,
    //                                                 fontWeight: FontWeight.w500,
    //                                               ),
    //                                             ),
    //                                             Expanded(child: Container()),
    //                                             Container(
    //                                               width: 100.h,
    //                                               height: 30.w,
    //                                               decoration: BoxDecoration(
    //                                                 color: AppColors
    //                                                     .BackgroudColor,
    //                                                 borderRadius:
    //                                                     BorderRadius.all(
    //                                                         Radius.circular(
    //                                                             5.r)),
    //                                               ),
    //                                               child: TextButton(
    //                                                   onPressed: () {},
    //                                                   child: Text("Add To Bag",
    //                                                       style: TextStyle(
    //                                                           fontSize: 10.sp,
    //                                                           color: Colors
    //                                                               .black))),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 }),
    //       ),
    //
    //       //   InkWell(
    //       //     onTap: (){
    //       //        Get.toNamed(itemListDetails);
    //       //     },
    //     ],
    //   ),
    // );


  }
}
