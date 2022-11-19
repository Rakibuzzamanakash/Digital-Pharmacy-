import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Model/product_model.dart';
import 'package:heath/Provider/product_provider.dart';
import 'package:http/http.dart' as http;

import '../Const/base_url.dart';
import '../Model/notification_model.dart';


class ProductController extends GetxController{

  ProductModel? productModel;
  RxBool isDataloading = false.obs ;
  final Box = GetStorage();
  final baseurl = BaseUrl.baseurl;

  RxList<Products> cart = <Products>[].obs;

  var isDataProcessing = false.obs;

  NotificationModel? notificationModel;


  @override
  void  onInit() async{
    super.onInit();
    getProductdata();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }


  getProductdata()async{
    try{
      isDataloading(true);
      // 'https://dutchpharmalimited.com/api/products';
      final token = Box.read('token');

      http.Response response = await http.get(
        Uri.tryParse('${baseurl}api/products')!,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        }
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        productModel = ProductModel.fromJson(data);
      }else{

      }

    }catch(e){
      print('Error while getting data is $e');
    }finally{
      isDataloading(false);
    }
  }

  addtoCart(int id, index) {
    cart.add(Products(id: id,));
    print(cart[id].id,);
    update();
  }

 // (index){
 //    cart.add(index);
 //    print(cart);
 // }









  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

  }

}

// class ProductController extends GetxController{
//   // ProductModel? productModel;
//   // RxBool isDataloading = false.obs ;
//   // final Box = GetStorage();
//   // final baseurl = BaseUrl.baseurl;
//
//   var lstTask = List<dynamic>.empty(growable: true).obs;
//   var page = 1;
//   var isDataProcessing = false.obs;
//
//   NotificationModel? notificationModel;
//
//   ScrollController scrollController = ScrollController();
//   var isMoreDataAvailable = true.obs;
//
//   RxBool _showBackToTopButton = false.obs;
//
//   @override
//   void  onInit() async{
//     super.onInit();
//     getProductdata(page);
//     paginateTask();
//     scrollToTop();
//   }
//
//   @override
//   Future<void> onReady() async {
//     super.onReady();
//   }
//
//
//   void scrollToTop() {
//     scrollController.animateTo(0,
//         duration: const Duration(seconds: 3), curve: Curves.linear);
//   }
//
//   // getProductdata()async{
//   //   try{
//   //     isDataloading(true);
//   //     // 'https://dutchpharmalimited.com/api/products';
//   //     final token = Box.read('token');
//   //
//   //     http.Response response = await http.get(
//   //       Uri.tryParse('${baseurl}api/products')!,
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: "application/json",
//   //         HttpHeaders.authorizationHeader: "Bearer $token"
//   //       }
//   //     );
//   //     if(response.statusCode == 200){
//   //       var data = jsonDecode(response.body);
//   //       productModel = ProductModel.fromJson(data);
//   //     }else{
//   //
//   //     }
//   //
//   //   }catch(e){
//   //     print('Error while getting data is $e');
//   //   }finally{
//   //     isDataloading(false);
//   //   }
//   // }
//
//
//   void getProductdata(var page) {
//     try {
//       isMoreDataAvailable(false);
//       isDataProcessing(true);
//       ProductProvider().getProductdata(page).then((resp) {
//         isDataProcessing(false);
//         lstTask.addAll(resp);
//       }, onError: (err) {
//         isDataProcessing(false);
//         showSnackBar("Error", err.toString(), Colors.red);
//       });
//     } catch (exception) {
//       isDataProcessing(false);
//       showSnackBar("Exception", exception.toString(), Colors.red);
//     }
//   }
//
//
//
//   showSnackBar(String title, String message, Color backgroundColor) {
//     Get.snackbar(title, message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: backgroundColor,
//         colorText: Colors.white);
//   }
//
//   // For Pagination
//   void paginateTask() {
//     scrollController.addListener(() {
//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         print("reached end");
//         page++;
//         getMoreTask(page);
//       }
//     });
//   }
//
//
//   // Get More data
//   void getMoreTask(var page) {
//     try {
//       ProductProvider().getProductdata(page).then((resp) {
//         if (resp.length > 0) {
//           isMoreDataAvailable(true);
//         } else {
//           isMoreDataAvailable(false);
//           showSnackBar("Message", "No more items", Colors.lightBlueAccent);
//         }
//         lstTask.addAll(resp);
//       }, onError: (err) {
//         isMoreDataAvailable(false);
//         showSnackBar("Error", err.toString(), Colors.red);
//       });
//     } catch (exception) {
//       isMoreDataAvailable(false);
//       showSnackBar("Exception", exception.toString(), Colors.red);
//     }
//   }
//
//
//
//   void refreshList() async {
//     page = 1;
//     getProductdata(page);
//   }
//
//
//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//     scrollController.dispose();
//   }
//
// }

  