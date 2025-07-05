import '../methods/cancle_booking.dart';
import '../methods/cancle_booking_by_customer.dart';
import '../models/room.dart';
import '../models/customer.dart';
import '../models/booking.dart';

import '../methods/add_room.dart';
import '../methods/get_available_rooms.dart';
import '../methods/find_room_by_number.dart';
import '../methods/remove_room.dart';
import '../methods/book_room.dart';
import '../methods/find_booking_by_room.dart';
import '../methods/find_booking_by_id.dart';
import '../methods/view_booking_details.dart';
import '../methods/view_all_bookings.dart';

class HotelService {
  List<Room> rooms = [];
  List<Booking> bookings = [];

  void addRoomToList(Room room) => addRoom(rooms, room);
  List<Room> getRoomsAvailable() => getAvailableRooms(rooms);
  Room? findRoom(int number) => findRoomByNumber(rooms, number);
  void removeRoomFromList(int number) => removeRoom(rooms, number);

  void book(Room room, Customer customer, int nights) =>
      bookRoom(bookings, customer, room, nights);

  Booking? findBookingByRoom(int roomNumber) =>
      findBookingByRoomNumber(bookings, roomNumber);

  Booking? findBookingById(String idNumber, int roomNumber) =>
    findBookingByCustomerId(bookings, idNumber, roomNumber); 

  bool cancelByCustomer(String idNumber, int roomNumber) =>
      cancelBookingByCustomer(bookings, idNumber, roomNumber);

  void cancelByObject(Booking booking) => cancelBooking(bookings, booking);

  void showBookingDetails(Booking booking) => viewBookingDetails(booking);
  void showAllBookings() => viewAllBookings(bookings);
}