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
    return rooms.firstWhere(
      (room) => room.roomNumber == roomNumber,
      orElse: () => throw Exception("Room not found"),
    );
  }

  void removeRoom(int roomNumber) {
    rooms.removeWhere((room) => room.roomNumber == roomNumber);
    print("Room $roomNumber removed successfully");
  }

  void bookRoom(Customer customer, Room room, int numberOfNights) {
    if (!room.isBooked) {
      room.isBooked = true;
      Booking booking = Booking(customer, room, numberOfNights);
      bookings.add(booking);
      print("Booking completed: ${booking}");
    } else {
      print("Room ${room.roomNumber} is already booked");
    }
  }

  Booking? findBookingByRoomNumber(int roomNumber) {
    return bookings.firstWhere(
      (booking) => booking.room.roomNumber == roomNumber,
      orElse: () => throw Exception("Booking not found"),
    );
  }

  void cancelBooking(Booking booking) {
    Room room = booking.room;
    room.isBooked = false;
    bookings.remove(booking);
    print("Booking for Room ${room.roomNumber} cancelled successfully");
  }

  void viewBookingDetails(Booking booking) {
    print(booking);
  }

  void viewAllBookings() {
    if (bookings.isEmpty) {
      print("No bookings found.");
    } else {
      for (var booking in bookings) {
        print(booking);
      }
    }
  }
}
