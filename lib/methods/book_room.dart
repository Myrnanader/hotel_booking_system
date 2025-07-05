import '../models/room.dart';
import '../models/customer.dart';
import '../models/booking.dart';

void bookRoom(List<Booking> bookings, Customer customer, Room room, int numberOfNights) {
  if (!room.isBooked) {
    room.isBooked = true;
    Booking booking = Booking(customer, room, numberOfNights);
    bookings.add(booking);
    print("booking completed:\n$booking");
  } else {
    print(" room ${room.roomNumber} is already booked");
  }
}