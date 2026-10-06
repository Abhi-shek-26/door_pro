import 'package:flutter/foundation.dart';

import '../model/booking_model.dart';
import '../model/service_model.dart';


class BookingViewModel extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedTimeSlot = '10:00 AM - 11:00 AM';
  bool _isSubmitting = false;

  final List<String> availableTimeSlots = const [
    '09:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '02:00 PM - 03:00 PM',
    '04:00 PM - 05:00 PM',
  ];

  DateTime get selectedDate => _selectedDate;
  String get selectedTimeSlot => _selectedTimeSlot;
  bool get isSubmitting => _isSubmitting;

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setTimeSlot(String timeSlot) {
    _selectedTimeSlot = timeSlot;
    notifyListeners();
  }

  Future<BookingModel?> submitBooking({
    required ServiceModel service,
    required String name,
    required String phone,
    required String address,
  }) async {
    _isSubmitting = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _isSubmitting = false;
    notifyListeners();

    return BookingModel(
      bookingId: 'BK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      service: service,
      date: _selectedDate,
      timeSlot: _selectedTimeSlot,
      customerName: name,
      customerPhone: phone,
      customerAddress: address,
    );
  }
}