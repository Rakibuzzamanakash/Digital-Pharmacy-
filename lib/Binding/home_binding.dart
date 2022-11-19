import 'package:get/get.dart';
import 'package:heath/Model/product_model.dart';
import 'package:heath/controller%20/productController.dart';
import 'package:heath/controller%20/slider_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SliderController>(() => SliderController());

  }
}