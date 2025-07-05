import '../models/booking.dart';

Booking? findBookingByCustomerId(List<Booking> bookings, String idNumber, int roomNumber) {
  try {
    return bookings.firstWhere(
      (booking) =>
          booking.customer.idNumber == idNumber &&
          booking.room.roomNumber == roomNumber,
    );
  } catch (_) {
    return null;
  }
}