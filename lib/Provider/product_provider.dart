
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Const/base_url.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends GetConnect{
  final Box = GetStorage();
  final baseurl = BaseUrl.baseurl;

  // Future<List<dynamic>> getTask(var page) async {
  //   try {
  //     final response = await get(
  //         "http://192.168.43.152:81/TodoApp/public/api/getTask?page=$page");
  //     if (response.status.hasError) {
  //       return Future.error(response.status.toString());
  //     } else {
  //       return response.body['data'];
  //     }
  //   }
  //   catch(exception)
  //   {
  //
  //     return Future.error(exception.toString());
  //   }
  // }

  Future<List<dynamic>>   getProductdata(var page)async{


      try {
        final token = Box.read('token');
            final response = await get(
                '${baseurl}api/products?page=$page',
                headers: {
                  HttpHeaders.contentTypeHeader: "application/json",
                  HttpHeaders.authorizationHeader: "Bearer $token"
                }
            );
        if (response.status.hasError) {
          return Future.error(response.status.toString());
        } else {
          return response.body['products'];
        }
      }
      catch(exception)
      {

        return Future.error(exception.toString());
      }

  //   try{
  //     //isDataloading(true);
  //     // 'https://dutchpharmalimited.com/api/products';
  //     final token = Box.read('token');
  //
  //     final response = await get(
  //         '${baseurl}api/products?page=$page',
  //         headers: {
  //           HttpHeaders.contentTypeHeader: "application/json",
  //           HttpHeaders.authorizationHeader: "Bearer $token"
  //         }
  //     );
  //     if(response.status.hasError){
  //       return Future.error(response.status.toString());
  //     }else{
  //       return response.body['products'];
  //     }
  //
  //   }catch(e){
  //     print('Error while getting data is $e');
  //   }
  //
  }

}