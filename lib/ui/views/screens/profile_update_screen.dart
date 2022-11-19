import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:heath/ui/routes/route.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heath/ui/views/widgets/textfiled_input.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Const/base_url.dart';
import '../../../controller /user_controller.dart';
import '../../style/style.dart';

class ProfileUpdate extends StatefulWidget {

  ProfileUpdate();
  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  UserController userController = Get.put(UserController());
  String _baseUrl = BaseUrl.baseurl;

  final Box = GetStorage();
  final ImagePicker _picker = ImagePicker();

  File? _profileImage;
  File? _tradeImage;
  File? _licencesImage;
  File? _tinImage;
  File? _nidImage;

  TextEditingController pharmacyNameController = TextEditingController();
  TextEditingController tradeController = TextEditingController();
  TextEditingController licenceController = TextEditingController();
  TextEditingController tinController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future getProfileImage() async {
    final picProfileImage =
    await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (picProfileImage != null) {
        _profileImage = File(picProfileImage.path);
      } else {
        print('No profile image found');
      }
    });
  }

  Future gettradeImage() async {
    final pictradeImage = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pictradeImage != null) {
        _tradeImage = File(pictradeImage.path);
      } else {
        print('No trade image found');
      }
    });
  }

  Future getlicencesImage() async {
    final piclicencesImage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (piclicencesImage != null) {
        _licencesImage = File(piclicencesImage.path);
      } else {
        print('No trade image found');
      }
    });
  }

  Future gettinImage() async {
    final pictinImage = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pictinImage != null) {
        _tinImage = File(pictinImage.path);
      } else {
        print('No trade image found');
      }
    });
  }

  Future getnidImage() async {
    final picnidImage = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (picnidImage != null) {
        _nidImage = File(picnidImage.path);
      } else {
        print('No trade image found');
      }
    });
  }

  Future profileUpload()async{
    if(_profileImage != null && _tradeImage != null && _licencesImage != null && _tinImage != null && _nidImage != null
    && pharmacyNameController.text.isNotEmpty && tradeController.text.isNotEmpty && licenceController.text.isNotEmpty &&
    tinController.text.isNotEmpty && nidController.text.isNotEmpty && pharmacyNameController.text.isNotEmpty
    ){

      final token = await Box.read('token');
      final id = await Box.read('id');
      var request = http.MultipartRequest('POST', Uri.parse('https://dutchpharmalimited.com/api/user/profile/update'));

      request.headers.addAll({
        'Authorization': 'Bearer $token',
        "Content-type": "multipart/form-data",
      });

      request.fields['user_id'] = '$id';
      request.fields['pharmacy_name'] = pharmacyNameController.text;
      request.fields['trade_licence_number'] = tradeController.text;
      request.fields['drag_licence_number'] = licenceController.text;
      request.fields['tin_number'] = tinController.text;
      request.fields['nid_number'] = nidController.text;
      request.fields['pharmacy_address'] = licenceController.text;
      request.files.add(await http.MultipartFile.fromPath('profile', _profileImage!.path));
      request.files.add(await http.MultipartFile.fromPath('trade_licence', _tradeImage!.path));
      request.files.add(await http.MultipartFile.fromPath('drag_licence', _licencesImage!.path));
      request.files.add(await http.MultipartFile.fromPath('tin', _tinImage!.path));
      request.files.add(await http.MultipartFile.fromPath('nid', _nidImage!.path));


      var response =await request.send();

      //for getting and decoding the response into json format
      var responsed = await http.Response.fromStream(response);
      final responseData = json.decode(responsed.body);


      if (response.statusCode==200) {
        print("SUCCESS");
        Get.snackbar('Alert', responseData['message'],
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed(bottonController);
        print(responseData);
      }
      else if(response.statusCode == 404){
        Get.snackbar('Alert', 'Profile upload fail',
            snackPosition: SnackPosition.BOTTOM);
        print("ERROR");
      }
    }else{
      Get.snackbar('Warning', 'Blank field is not allowed',
          snackPosition: SnackPosition.BOTTOM);
    }

  }

  @override
  void initState() {
    profileUpload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Update Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white70,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Card(
              color: Colors.white10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: ListView(
                  children: [
                    userController.isDataLoading.value ?
                    Container(
                      height: 150.h,
                      width: double.infinity.w,
                      child: Card(
                        elevation: 0.3,
                        child: Center(child: CircularProgressIndicator(),),
                      ),
                    ):
                    Container(
                      height: 150.h,
                      width: double.infinity.w,
                      child: Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 110.h,
                                    width: 110.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage('${_baseUrl}${userController.userModel!.userProfile!.profile.toString()}')
                                        )
                                    ),
                                    // child: userController.userModel!.userProfile!.profile.toString() == null?
                                    // Center(child: CircularProgressIndicator(),)
                                    // :Image.network(userController.userModel!.userProfile!.profile.toString()),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(userController.userModel!.userProfile!.name.toString(),
                                          style: style18(Colors.black)),
                                      SizedBox(height: 3.h),
                                      Text(
                                        userController.userModel!.userProfile!.email.toString(),
                                        style: style12(Colors.black),
                                      ),
                                      Text(
                                        userController.userModel!.userProfile!.pharmacyAddress.toString(),
                                        style: style12(Colors.black),
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
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: 100.h,
                    //       width: 100.w,
                    //       color: Colors.blueGrey,
                    //       child: Image.network(
                    //         '',
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //     Spacer(),
                    //     Container(
                    //       width: 205.w,
                    //       height: 100.h,
                    //       color: Colors.teal,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             '',
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //           Text(
                    //            '',
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //           Text(
                    //             '',
                    //             style: TextStyle(fontWeight: FontWeight.bold),
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text('Choose Profile'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 200.h,
                        child: _profileImage == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getProfileImage();
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                        size: 40,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('Choose Profile photo'),
                                ],
                              )
                            : Image.file(
                                File(
                                  _profileImage!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Pharmacy Name'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextInputField(hint: 'Pharmacy Name',Controller: pharmacyNameController,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Trade Licences Number'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextInputField(hint: 'Trade Licences Number',Controller: tradeController,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Trade Licences'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 200.h,
                        child: _tradeImage == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        gettradeImage();
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                        size: 40,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('Choose Trade Licences photo'),
                                ],
                              )
                            : Image.file(
                                File(_tradeImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Drag Licences Number'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextInputField(hint: 'Drag Licences Number',Controller: licenceController,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Drag Licences'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 200.h,
                        child: _licencesImage == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getlicencesImage();
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                        size: 40,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('Choose Drag Licences photo'),
                                ],
                              )
                            : Image.file(
                                File(_licencesImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Tin Number'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextInputField(hint: 'Tin Number',Controller: tinController,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Tin'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 200.h,
                        child: _tinImage == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        gettinImage();
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                        size: 40,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('Choose Tin photo'),
                                ],
                              )
                            : Image.file(
                                File(_tinImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('NID Number'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextInputField(hint: 'NID Number',Controller: nidController,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('NID'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 200.h,
                        child: _nidImage == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getnidImage();
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                        size: 40,
                                      )),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('Choose NID photo'),
                                ],
                              )
                            : Image.file(
                                File(_nidImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Pharmacy Addresss'),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextInputField(hint: 'Pharmacy Addresss',Controller: addressController,),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: (){
                        profileUpload();
                      },
                      child: Container(
                        color: Colors.green,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          child: Center(child: Text('Update Profile')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
