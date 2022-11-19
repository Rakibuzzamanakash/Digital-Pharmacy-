import 'dart:convert';
/// status : "s"
/// user_profile : {"id":13,"name":"test102","email":"000","otp":"430255","active_status":"0","email_verified_at":null,"pharmacy_name":"11","pharmacy_address":"11","trade_licence_number":"11","trade_licence":"public/images/tradelicence/image/16676692798562scaled_image_picker789072822561528938.jpg","drag_licence_number":"11","drag_licence":"public/images/draglicence/image/16676692798562scaled_image_picker8043632953020657138.jpg","tin_number":"11","tin":"public/images/tin/image/16676692798562scaled_image_picker2501985953517346716.jpg","nid_number":"123","nid":"public/images/userprofile/image/16676692798562scaled_image_picker9213198422780968254.jpg","profile":"public/images/user/profile/16676692798562image_picker6563694315951277574.jpg","status":"Inactive","created_at":"2022-10-18T18:22:47.000000Z","updated_at":"2022-11-05T17:27:59.000000Z"}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      String? status, 
      UserProfile? userProfile,}){
    _status = status;
    _userProfile = userProfile;
}

  UserModel.fromJson(dynamic json) {
    _status = json['status'];
    _userProfile = json['user_profile'] != null ? UserProfile.fromJson(json['user_profile']) : null;
  }
  String? _status;
  UserProfile? _userProfile;
UserModel copyWith({  String? status,
  UserProfile? userProfile,
}) => UserModel(  status: status ?? _status,
  userProfile: userProfile ?? _userProfile,
);
  String? get status => _status;
  UserProfile? get userProfile => _userProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_userProfile != null) {
      map['user_profile'] = _userProfile?.toJson();
    }
    return map;
  }

}

/// id : 13
/// name : "test102"
/// email : "000"
/// otp : "430255"
/// active_status : "0"
/// email_verified_at : null
/// pharmacy_name : "11"
/// pharmacy_address : "11"
/// trade_licence_number : "11"
/// trade_licence : "public/images/tradelicence/image/16676692798562scaled_image_picker789072822561528938.jpg"
/// drag_licence_number : "11"
/// drag_licence : "public/images/draglicence/image/16676692798562scaled_image_picker8043632953020657138.jpg"
/// tin_number : "11"
/// tin : "public/images/tin/image/16676692798562scaled_image_picker2501985953517346716.jpg"
/// nid_number : "123"
/// nid : "public/images/userprofile/image/16676692798562scaled_image_picker9213198422780968254.jpg"
/// profile : "public/images/user/profile/16676692798562image_picker6563694315951277574.jpg"
/// status : "Inactive"
/// created_at : "2022-10-18T18:22:47.000000Z"
/// updated_at : "2022-11-05T17:27:59.000000Z"

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));
String userProfileToJson(UserProfile data) => json.encode(data.toJson());
class UserProfile {
  UserProfile({
      num? id, 
      String? name, 
      String? email, 
      String? otp, 
      String? activeStatus, 
      dynamic emailVerifiedAt, 
      String? pharmacyName, 
      String? pharmacyAddress, 
      String? tradeLicenceNumber, 
      String? tradeLicence, 
      String? dragLicenceNumber, 
      String? dragLicence, 
      String? tinNumber, 
      String? tin, 
      String? nidNumber, 
      String? nid, 
      String? profile, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _otp = otp;
    _activeStatus = activeStatus;
    _emailVerifiedAt = emailVerifiedAt;
    _pharmacyName = pharmacyName;
    _pharmacyAddress = pharmacyAddress;
    _tradeLicenceNumber = tradeLicenceNumber;
    _tradeLicence = tradeLicence;
    _dragLicenceNumber = dragLicenceNumber;
    _dragLicence = dragLicence;
    _tinNumber = tinNumber;
    _tin = tin;
    _nidNumber = nidNumber;
    _nid = nid;
    _profile = profile;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserProfile.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _otp = json['otp'];
    _activeStatus = json['active_status'];
    _emailVerifiedAt = json['email_verified_at'];
    _pharmacyName = json['pharmacy_name'];
    _pharmacyAddress = json['pharmacy_address'];
    _tradeLicenceNumber = json['trade_licence_number'];
    _tradeLicence = json['trade_licence'];
    _dragLicenceNumber = json['drag_licence_number'];
    _dragLicence = json['drag_licence'];
    _tinNumber = json['tin_number'];
    _tin = json['tin'];
    _nidNumber = json['nid_number'];
    _nid = json['nid'];
    _profile = json['profile'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _otp;
  String? _activeStatus;
  dynamic _emailVerifiedAt;
  String? _pharmacyName;
  String? _pharmacyAddress;
  String? _tradeLicenceNumber;
  String? _tradeLicence;
  String? _dragLicenceNumber;
  String? _dragLicence;
  String? _tinNumber;
  String? _tin;
  String? _nidNumber;
  String? _nid;
  String? _profile;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
UserProfile copyWith({  num? id,
  String? name,
  String? email,
  String? otp,
  String? activeStatus,
  dynamic emailVerifiedAt,
  String? pharmacyName,
  String? pharmacyAddress,
  String? tradeLicenceNumber,
  String? tradeLicence,
  String? dragLicenceNumber,
  String? dragLicence,
  String? tinNumber,
  String? tin,
  String? nidNumber,
  String? nid,
  String? profile,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => UserProfile(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  otp: otp ?? _otp,
  activeStatus: activeStatus ?? _activeStatus,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  pharmacyName: pharmacyName ?? _pharmacyName,
  pharmacyAddress: pharmacyAddress ?? _pharmacyAddress,
  tradeLicenceNumber: tradeLicenceNumber ?? _tradeLicenceNumber,
  tradeLicence: tradeLicence ?? _tradeLicence,
  dragLicenceNumber: dragLicenceNumber ?? _dragLicenceNumber,
  dragLicence: dragLicence ?? _dragLicence,
  tinNumber: tinNumber ?? _tinNumber,
  tin: tin ?? _tin,
  nidNumber: nidNumber ?? _nidNumber,
  nid: nid ?? _nid,
  profile: profile ?? _profile,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get otp => _otp;
  String? get activeStatus => _activeStatus;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get pharmacyName => _pharmacyName;
  String? get pharmacyAddress => _pharmacyAddress;
  String? get tradeLicenceNumber => _tradeLicenceNumber;
  String? get tradeLicence => _tradeLicence;
  String? get dragLicenceNumber => _dragLicenceNumber;
  String? get dragLicence => _dragLicence;
  String? get tinNumber => _tinNumber;
  String? get tin => _tin;
  String? get nidNumber => _nidNumber;
  String? get nid => _nid;
  String? get profile => _profile;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['otp'] = _otp;
    map['active_status'] = _activeStatus;
    map['email_verified_at'] = _emailVerifiedAt;
    map['pharmacy_name'] = _pharmacyName;
    map['pharmacy_address'] = _pharmacyAddress;
    map['trade_licence_number'] = _tradeLicenceNumber;
    map['trade_licence'] = _tradeLicence;
    map['drag_licence_number'] = _dragLicenceNumber;
    map['drag_licence'] = _dragLicence;
    map['tin_number'] = _tinNumber;
    map['tin'] = _tin;
    map['nid_number'] = _nidNumber;
    map['nid'] = _nid;
    map['profile'] = _profile;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}