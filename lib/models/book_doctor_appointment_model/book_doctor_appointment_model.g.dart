// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctor_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointmentModel _$DoctorAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    DoctorAppointmentModel(
      doctorId: json['doctorId'] as String?,
      id: json['id'] as String?,
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      appointmentDateTime: json['appointmentDateTime'] as String?,
      condition: json['condition'] as String?,
      status: json['status'] as String?,
      patientId: json['patientId'] as String?,
      patientName: json['patientName'] as String?,
    );

Map<String, dynamic> _$DoctorAppointmentModelToJson(
        DoctorAppointmentModel instance) =>
    <String, dynamic>{
      'doctorId': instance.doctorId,
      'id': instance.id,
      'doctor': instance.doctor,
      'appointmentDateTime': instance.appointmentDateTime,
      'condition': instance.condition,
      'status': instance.status,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
    };
