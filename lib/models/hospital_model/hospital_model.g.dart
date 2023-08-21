// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      category: json['category'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      isVerified: json['isVerified'] as bool?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'age': instance.age,
      'category': instance.category,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'isVerified': instance.isVerified,
      'lat': instance.lat,
      'lng': instance.lng,
    };
