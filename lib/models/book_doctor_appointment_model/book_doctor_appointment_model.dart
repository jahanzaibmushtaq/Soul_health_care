import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';

part 'book_doctor_appointment_model.g.dart';

@JsonSerializable()
class DoctorAppointmentModel {
  String? doctorId;
  String? id;
  DoctorModel? doctor;
  String? appointmentDateTime;
  String? condition;
  String? status;
  String? patientId;
  String? patientName;

  DoctorAppointmentModel({
    this.doctorId,
    this.id,
    this.doctor,
    this.appointmentDateTime,
    this.condition,
    this.status,
    this.patientId,
    this.patientName,
  });

  factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointmentModelToJson(this);

  bool get isAccepted => status == "Accepted";

  String get dateTime {
    if (appointmentDateTime == null) {
      return 'N/A';
    }
    DateTime appointmentDate = DateTime.parse(appointmentDateTime!);
    String formattedTime = DateFormat('hh:mm a').format(appointmentDate);
    return DateFormat('yyyy-MM-dd').format(appointmentDate) + ' ' + formattedTime;
  }

}
