import 'dart:io';
import 'models/room.dart';
import 'models/booking.dart';
import 'services/hotel_service.dart';

void adminMenu(List<Room> rooms, List<Booking> bookings) {
  HotelService hotelService = HotelService();
  hotelService.rooms = rooms; 
  hotelService.bookings = bookings; 
  while (true) {
    print("\nAdmin Panel");
    print("1. Add a new room");
    print("2. Remove a room");
    print("3. View all rooms");
    print("4. View all bookings");
    print("5. Cancel a booking");
    print("6. View booking details");
    print("7. Exit");

    stdout.write("Select an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1': // إضافة غرفة جديدة
        stdout.write("Enter room number: ");
        int roomNumber = int.parse(stdin.readLineSync()!);
        stdout.write("Enter room price per night: ");
        double pricePerNight = double.parse(stdin.readLineSync()!);

        Room newRoom = Room(roomNumber, pricePerNight);
        hotelService.addRoom(newRoom);
        print("Room added successfully.");
        break;

      case '2': // حذف غرفة
        stdout.write("Enter room number to remove: ");
        int roomNumberToRemove = int.parse(stdin.readLineSync()!);
        hotelService.removeRoom(roomNumberToRemove);
        break;

      case '3': // عرض جميع الغرف
        List<Room> availableRooms = hotelService.getAvailableRooms();
        if (availableRooms.isEmpty) {
          print("No rooms available.");
        } else {
          for (var room in availableRooms) {
            print(room);
          }
        }
        break;

      case '4': // عرض جميع الحجوزات
        hotelService.viewAllBookings();
        break;

      case '5': // إلغاء حجز
        stdout.write("Enter room number to cancel booking: ");
        int roomNumberToCancel = int.parse(stdin.readLineSync()!);

        Booking? booking = hotelService.findBookingByRoomNumber(roomNumberToCancel);
        if (booking != null) {
          hotelService.cancelBooking(booking);
        } else {
          print("No booking found for Room $roomNumberToCancel.");
        }
        break;

      case '6': // عرض تفاصيل الحجز
        stdout.write("Enter room number to view booking details: ");
        int roomNumberToView = int.parse(stdin.readLineSync()!);

        Booking? booking = hotelService.findBookingByRoomNumber(roomNumberToView);
        if (booking != null) {
          hotelService.viewBookingDetails(booking);
        } else {
          print("No booking found for Room $roomNumberToView.");
        }
        break;

      case '7': 
        print("Exiting Admin Panel...");
        return;

      default:
        print("Invalid option.");
    }
  }
}