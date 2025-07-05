import '../models/booking.dart';

Booking? findBookingByRoomNumber(List<Booking> bookings, int roomNumber) {
  try {
    return bookings.firstWhere((booking) => booking.room.roomNumber == roomNumber);
  } catch (_) {
    print("Booking not found for Room $roomNumber");
    return null;
  }
}