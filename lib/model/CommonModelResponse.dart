import 'dart:convert';
/// title : ""
/// place : ""
/// date : ""
/// description : ""
/// img : ""

CommonModelResponse commonModelResponseFromJson(String str) => CommonModelResponse.fromJson(json.decode(str));
String commonModelResponseToJson(CommonModelResponse data) => json.encode(data.toJson());
class CommonModelResponse {
  CommonModelResponse({
      String? title, 
      String? video,
      String? place,
      String? date, 
      String? description, 
      String? img,}){
    _title = title;
    _video = video;
    _place = place;
    _date = date;
    _description = description;
    _img = img;
}

  CommonModelResponse.fromJson(dynamic json) {
    _title = json['title'];
    _video = json['video'];
    _place = json['place'];
    _date = json['date'];
    _description = json['description'];
    _img = json['img'];
  }
  String? _title;
  String? _video;
  String? _place;
  String? _date;
  String? _description;
  String? _img;
CommonModelResponse copyWith({  String? title,
  String? place,
  String? video,
  String? date,
  String? description,
  String? img,
}) => CommonModelResponse(  title: title ?? _title,
  place: place ?? _place,
  video: video ?? _video,
  date: date ?? _date,
  description: description ?? _description,
  img: img ?? _img,
);
  String? get title => _title;
  String? get video => _video;
  String? get place => _place;
  String? get date => _date;
  String? get description => _description;
  String? get img => _img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['video'] = _video;
    map['place'] = _place;
    map['date'] = _date;
    map['description'] = _description;
    map['img'] = _img;
    return map;
  }

}