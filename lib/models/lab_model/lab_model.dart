import 'package:json_annotation/json_annotation.dart';

part 'lab_model.g.dart';

@JsonSerializable()
class LabModel {
  String? name;
  String? gender;
  String? age;
  String? category;
  String? phoneNumber;
  String? address;
  bool? isVerified;
  String? lat;
  String? lng;
  LabModel({this.name, this.gender, this.age,
    this.category, this.phoneNumber, this.address,this.isVerified,
  this.lng, this.lat});

  factory LabModel.fromJson(Map<String, dynamic> json) =>
      _$LabModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabModelToJson(this);
}
