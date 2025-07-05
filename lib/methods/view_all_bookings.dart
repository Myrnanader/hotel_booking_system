import '../models/booking.dart';

void viewAllBookings(List<Booking> bookings) {
  if (bookings.isEmpty) {
    print("No bookings found.");
  } else {
    print(" All Bookings:");
    for (var booking in bookings) {
      print(booking);
    }
  }
}