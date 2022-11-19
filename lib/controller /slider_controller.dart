import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/Const/base_url.dart';
import '../Model/slider_img_model.dart';
import 'package:http/http.dart' as http;

class SliderController extends GetxController {
  final Box = GetStorage();
  final baseurl = BaseUrl.baseurl;

  SliderImgModel? sliderImgModel;
  var isDataLoading = false.obs;
  RxInt _currentIndex = 0.obs;
  get currentIndex => _currentIndex;
  @override
  void onInit() async {
    super.onInit();
    getsliderPhotoList();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  // getSliderPhotoList()async{
  //  SliderImgModel? slidermodel = await _repository.getSliderPhotoList();
  //
  //  sliderImgmodel.value = slidermodel;
  // }

  // SliderImgModel? sliderImgModel;

  //  @override
  // void  onInit(){
  //    getPhotoList();
  //    super.onInit();
  //  }

  // Future<SliderImgModel> getPhotoList() async {
  //   final token = await Box.read('token');
  //   final response = await http
  //       .get(Uri.parse('https://dutchpharmalimited.com/api/slider'),
  //       headers: {
  //         HttpHeaders.contentTypeHeader: "application/json",
  //         HttpHeaders.authorizationHeader: "Bearer $token"
  //       }
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return SliderImgModel.fromJson(data);
  //   } else {
  //     return SliderImgModel.fromJson(data);
  //   }
  // }

  //get getslider => getPhotoList();

  getsliderPhotoList() async {
    try {
      isDataLoading(true);
      final token = await Box.read('token');
      http.Response response = await http.get(
          Uri.tryParse('${baseurl}api/slider')!,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        sliderImgModel = SliderImgModel.fromJson(data);
      } else {
        // return SliderImgModel.fromJson(data);
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
