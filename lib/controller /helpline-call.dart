import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLineCall extends GetxController{
  final _url = Uri.parse('tel:01310818200');

  @override
  void onInit() {
    //phonecall();
    super.onInit();
  }


 Future phonecall()async{
    if (await canLaunchUrl(_url)) {
      launchUrl(_url);
    } else {
      // ignore: avoid_print
      print("Can't launch $_url");
    }
  }
}