import '../models/booking.dart';

bool cancelBookingByCustomer(List<Booking> bookings, String idNumber, int roomNumber) {
  try {
    final booking = bookings.firstWhere(
      (b) => b.customer.idNumber == idNumber && b.room.roomNumber == roomNumber,
    );
    booking.room.isBooked = false;
    bookings.remove(booking);
    print(" Booking for Room ${roomNumber} cancelled");
    return true;
  } catch (_) {
    print("no booking found for id $idNumber and Room $roomNumber");
    return false;
  }
}