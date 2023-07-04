import 'dart:convert';
/// title : ""
/// video : " "
/// place : ""
/// date : " "
/// description : ""
/// img : ""
/// images : [{"img":"","description":""},{"img":"","description":""},{"img":"","description":""}]

GalleryResponseModel galleryResponseModelFromJson(String str) => GalleryResponseModel.fromJson(json.decode(str));
String galleryResponseModelToJson(GalleryResponseModel data) => json.encode(data.toJson());
class GalleryResponseModel {
  GalleryResponseModel({
      String? title, 
      String? video, 
      String? place, 
      String? date, 
      String? description, 
      String? img, 
      List<Images>? images,}){
    _title = title;
    _video = video;
    _place = place;
    _date = date;
    _description = description;
    _img = img;
    _images = images;
}

  GalleryResponseModel.fromJson(dynamic json) {
    _title = json['title'];
    _video = json['video'];
    _place = json['place'];
    _date = json['date'];
    _description = json['description'];
    _img = json['img'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
  }
  String? _title;
  String? _video;
  String? _place;
  String? _date;
  String? _description;
  String? _img;
  List<Images>? _images;
GalleryResponseModel copyWith({  String? title,
  String? video,
  String? place,
  String? date,
  String? description,
  String? img,
  List<Images>? images,
}) => GalleryResponseModel(  title: title ?? _title,
  video: video ?? _video,
  place: place ?? _place,
  date: date ?? _date,
  description: description ?? _description,
  img: img ?? _img,
  images: images ?? _images,
);
  String? get title => _title;
  String? get video => _video;
  String? get place => _place;
  String? get date => _date;
  String? get description => _description;
  String? get img => _img;
  List<Images>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['video'] = _video;
    map['place'] = _place;
    map['date'] = _date;
    map['description'] = _description;
    map['img'] = _img;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// img : ""
/// description : ""

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));
String imagesToJson(Images data) => json.encode(data.toJson());
class Images {
  Images({
      String? img, 
      String? description,}){
    _img = img;
    _description = description;
}

  Images.fromJson(dynamic json) {
    _img = json['img'];
    _description = json['description'];
  }
  String? _img;
  String? _description;
Images copyWith({  String? img,
  String? description,
}) => Images(  img: img ?? _img,
  description: description ?? _description,
);
  String? get img => _img;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = _img;
    map['description'] = _description;
    return map;
  }

}