import '../models/booking.dart';

void cancelBooking(List<Booking> bookings, Booking booking) {
  booking.room.isBooked = false;
  bookings.remove(booking);
  print("Booking for Room ${booking.room.roomNumber} cancelled");
}