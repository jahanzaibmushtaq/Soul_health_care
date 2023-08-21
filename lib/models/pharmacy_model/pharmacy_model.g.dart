// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyModel _$PharmacyModelFromJson(Map<String, dynamic> json) =>
    PharmacyModel(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      category: json['category'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      isVerified: json['isVerified'] as bool?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$PharmacyModelToJson(PharmacyModel instance) =>
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
