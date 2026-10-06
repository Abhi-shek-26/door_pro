import 'package:door_pro/model/service_model.dart';

class BookingModel {
  final String bookingId;
  final ServiceModel service;
  final DateTime date;
  final String timeSlot;
  final String customerName;
  final String customerPhone;
  final String customerAddress;



  const BookingModel({
    required this.bookingId,
    required this.service,
    required this.date,
    required this.timeSlot,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
});

}