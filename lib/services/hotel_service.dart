import '../models/room.dart';
import '../models/customer.dart';
import '../models/booking.dart';

class HotelService {
  List<Room> rooms = [];
  List<Booking> bookings = [];

  void addRoom(Room room) {
    rooms.add(room);
  }

  List<Room> getAvailableRooms() {
    return rooms.where((room) => !room.isBooked).toList();
  }

  Room? findRoomByNumber(int roomNumber) {
    try {
      return rooms.firstWhere((room) => room.roomNumber == roomNumber);
    } catch (_) {
      print(" Room $roomNumber not found.");
      return null;
    }
  }

  void removeRoom(int roomNumber) {
    rooms.removeWhere((room) => room.roomNumber == roomNumber);
    print(" Room $roomNumber removed successfully.");
  }

  void bookRoom(Customer customer, Room room, int numberOfNights) {
    if (!room.isBooked) {
      room.isBooked = true;
      Booking booking = Booking(customer, room, numberOfNights);
      bookings.add(booking);
      print(" Booking completed:");
      print(booking);
    } else {
      print(" Room ${room.roomNumber} is already booked.");
    }
  }

  Booking? findBookingByRoomNumber(int roomNumber) {
    try {
      return bookings.firstWhere(
        (booking) => booking.room.roomNumber == roomNumber,
      );
    } catch (_) {
      print(" Booking not found for Room $roomNumber.");
      return null;
    }
  }

  Booking? findBookingByCustomerId(String idNumber) {
    try {
      return bookings.firstWhere(
        (booking) => booking.customer.idNumber == idNumber,
      );
    } catch (_) {
      return null;
    }
  }

bool cancelBookingByCustomer(String idNumber, int roomNumber) {
  Booking? booking;

  try {
    booking = bookings.firstWhere(
      (b) =>
          b.customer.idNumber == idNumber &&
          b.room.roomNumber == roomNumber,
    );
  } catch (_) {
    print(" No booking found for Customer ID: $idNumber and Room: $roomNumber.");
    return false;
  }

  booking.room.isBooked = false;
  bookings.remove(booking);
  print("Booking for Room ${booking.room.roomNumber} cancelled.");
  return true;
}
  void cancelBooking(Booking booking) {
    Room room = booking.room;
    room.isBooked = false;
    bookings.remove(booking);
    print(" Booking for Room ${room.roomNumber} cancelled successfully.");
  }

  void viewBookingDetails(Booking booking) {
    print(" Booking Details:");
    print(booking);
  }

  void viewAllBookings() {
    if (bookings.isEmpty) {
      print(" No bookings found.");
    } else {
      print("All Bookings:");
      for (var booking in bookings) {
        print(booking);
      }
    }
  }
}