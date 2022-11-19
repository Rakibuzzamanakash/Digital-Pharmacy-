import 'dart:convert';
/// status : "s"
/// notifications : [{"id":7,"title":"www.dutchpharmalimited. COM","comments":"<p>www.dutchpharmalimited. COM</p>","status":"Pending","created_at":"2022-10-21T19:00:25.000000Z"},{"id":6,"title":"বিশেষ বার্তা","comments":"<p>প্রিয় গ্রাহক, আমাদের খুবই অল্প সংখ্যক ফার্মেসি সকাল ০৬:০০টা থেকে ০৯:০০ তা পর্যন্ত অর্ডার করে থাকেন। এই অল্প সংখ্যক অর্ডার এর জন্য আমাদের ৯৫% সম্মানিত ফার্মেসির পরিচালকদের পণ্য পেতে দেরি হয়। HealthOS সবসময় ফার্মেসির বন্ধু হয়ে থাকতে চায়।&nbsp; তাই আপনাদের মতামত ও পরামর্শের ভিত্তিতে,&nbsp; আগামী ১৫ অক্টোবর থেকে, অর্ডার করার শেষ সময় সকাল ০৬:০০টায়। অর্থাৎ সকাল ০৬:০০ টায় অর্ডার করলে আপনারা একই দিনে পণ্য পাবেন, সকাল ০৬:০০টার পরে অর্ডার করলে পণ্য তার পরবর্তী দিনে পাবেন। আশা করছি এই পরিবর্তনের মাধ্যমে আমরা আপনাদের হাতে আরো দ্রুত ও মানসম্মত ভাবে পণ্য পৌঁছে দিতে পারব। ধন্যবাদান্তে, HealthOS ফার্মাসির বন্ধু!<br></p>","status":"Pending","created_at":"2022-10-14T08:53:21.000000Z"},{"id":5,"title":"বিশেষ বার্তা","comments":"<p>প্রিয় গ্রাহক, আমাদের খুবই অল্প সংখ্যক ফার্মেসি সকাল ০৬:০০টা থেকে ০৯:০০ তা পর্যন্ত অর্ডার করে থাকেন। এই অল্প সংখ্যক অর্ডার এর জন্য আমাদের ৯৫% সম্মানিত ফার্মেসির পরিচালকদের পণ্য পেতে দেরি হয়। HealthOS সবসময় ফার্মেসির বন্ধু হয়ে থাকতে চায়।&nbsp; তাই আপনাদের মতামত ও পরামর্শের ভিত্তিতে,&nbsp; আগামী ১৫ অক্টোবর থেকে, অর্ডার করার শেষ সময় সকাল ০৬:০০টায়। অর্থাৎ সকাল ০৬:০০ টায় অর্ডার করলে আপনারা একই দিনে পণ্য পাবেন, সকাল ০৬:০০টার পরে অর্ডার করলে পণ্য তার পরবর্তী দিনে পাবেন। আশা করছি এই পরিবর্তনের মাধ্যমে আমরা আপনাদের হাতে আরো দ্রুত ও মানসম্মত ভাবে পণ্য পৌঁছে দিতে পারব। ধন্যবাদান্তে, HealthOS ফার্মাসির বন্ধু!<br></p>","status":"Pending","created_at":"2022-10-14T08:52:50.000000Z"}]

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));
String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());
class NotificationModel {
  NotificationModel({
      String? status, 
      List<Notifications>? notifications,}){
    _status = status;
    _notifications = notifications;
}

  NotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  String? _status;
  List<Notifications>? _notifications;
NotificationModel copyWith({  String? status,
  List<Notifications>? notifications,
}) => NotificationModel(  status: status ?? _status,
  notifications: notifications ?? _notifications,
);
  String? get status => _status;
  List<Notifications>? get notifications => _notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// title : "www.dutchpharmalimited. COM"
/// comments : "<p>www.dutchpharmalimited. COM</p>"
/// status : "Pending"
/// created_at : "2022-10-21T19:00:25.000000Z"

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));
String notificationsToJson(Notifications data) => json.encode(data.toJson());
class Notifications {
  Notifications({
      num? id, 
      String? title, 
      String? comments, 
      String? status, 
      String? createdAt,}){
    _id = id;
    _title = title;
    _comments = comments;
    _status = status;
    _createdAt = createdAt;
}

  Notifications.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _comments = json['comments'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _title;
  String? _comments;
  String? _status;
  String? _createdAt;
Notifications copyWith({  num? id,
  String? title,
  String? comments,
  String? status,
  String? createdAt,
}) => Notifications(  id: id ?? _id,
  title: title ?? _title,
  comments: comments ?? _comments,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get comments => _comments;
  String? get status => _status;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['comments'] = _comments;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}