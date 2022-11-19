import 'package:get/get.dart';

import '../Model/product_model.dart';
import '../controller /productController.dart';

class ProductcartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }

}