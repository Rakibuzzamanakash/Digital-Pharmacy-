import 'dart:convert';
/// status : "s"
/// slider : [{"id":5,"slug":"yoyo-package","slider_image":"public/images/slider/1666049171_Unichem-Hero-Image-e1638758034243.jpg"}]

SliderImgModel sliderImgModelFromJson(String str) => SliderImgModel.fromJson(json.decode(str));
String sliderImgModelToJson(SliderImgModel data) => json.encode(data.toJson());
class SliderImgModel {
  SliderImgModel({
      String? status, 
      List<Slider>? slider,}){
    _status = status;
    _slider = slider;
}

  SliderImgModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['slider'] != null) {
      _slider = [];
      json['slider'].forEach((v) {
        _slider?.add(Slider.fromJson(v));
      });
    }
  }
  String? _status;
  List<Slider>? _slider;
SliderImgModel copyWith({  String? status,
  List<Slider>? slider,
}) => SliderImgModel(  status: status ?? _status,
  slider: slider ?? _slider,
);
  String? get status => _status;
  List<Slider>? get slider => _slider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_slider != null) {
      map['slider'] = _slider?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// slug : "yoyo-package"
/// slider_image : "public/images/slider/1666049171_Unichem-Hero-Image-e1638758034243.jpg"

Slider sliderFromJson(String str) => Slider.fromJson(json.decode(str));
String sliderToJson(Slider data) => json.encode(data.toJson());
class Slider {
  Slider({
      num? id, 
      String? slug, 
      String? sliderImage,}){
    _id = id;
    _slug = slug;
    _sliderImage = sliderImage;
}

  Slider.fromJson(dynamic json) {
    _id = json['id'];
    _slug = json['slug'];
    _sliderImage = json['slider_image'];
  }
  num? _id;
  String? _slug;
  String? _sliderImage;
Slider copyWith({  num? id,
  String? slug,
  String? sliderImage,
}) => Slider(  id: id ?? _id,
  slug: slug ?? _slug,
  sliderImage: sliderImage ?? _sliderImage,
);
  num? get id => _id;
  String? get slug => _slug;
  String? get sliderImage => _sliderImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slug'] = _slug;
    map['slider_image'] = _sliderImage;
    return map;
  }

}