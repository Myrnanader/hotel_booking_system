import 'dart:io';
import 'models/booking.dart';
import 'models/room.dart';
import 'services/hotel_service.dart';

void adminMenu(List<Room> rooms, List<Booking> bookings) {
  HotelService hotelService = HotelService();
  hotelService.rooms = rooms;
  hotelService.bookings = bookings;

  while (true) {
    print("\n========== Admin Panel ==========");
    print("1. Add a new room");
    print("2. Remove a room");
    print("3. View available rooms");
    print("4. View all bookings");
    print("5. Cancel a booking");
    print("6. View booking details");
    print("7. Exit");

    stdout.write("Select an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter room number: ");
        int roomNumber = int.parse(stdin.readLineSync()!);

        stdout.write("Enter room price per night: ");
        double pricePerNight = double.parse(stdin.readLineSync()!);

        Room newRoom = Room(roomNumber, pricePerNight);
        hotelService.addRoomToList(newRoom);
        break;

      case '2':
        stdout.write("Enter room number to remove: ");
        int roomNumberToRemove = int.parse(stdin.readLineSync()!);

        hotelService.removeRoomFromList(roomNumberToRemove);
        break;

      case '3':
        List<Room> availableRooms = hotelService.getRoomsAvailable();
        if (availableRooms.isEmpty) {
          print(" No rooms available.");
        } else {
          print("📦 Available Rooms:");
          for (var room in availableRooms) {
            print(room);
          }
        }
        break;

      case '4':
        hotelService.showAllBookings();
        break;

      case '5':
        stdout.write("Enter customer's ID number: ");
        String idNumber = stdin.readLineSync()!;

        stdout.write("Enter room number to cancel booking: ");
        int roomNumber = int.parse(stdin.readLineSync()!);

        bool cancelled = hotelService.cancelByCustomer(idNumber, roomNumber);
        if (!cancelled) {
          print(" Unable to cancel. Booking not found.");
        }
        break;

      case '6':
        stdout.write("Enter customer's ID number: ");
        String idNumber = stdin.readLineSync()!;

        stdout.write("Enter room number to view booking details: ");
        int roomNumber = int.parse(stdin.readLineSync()!);

        Booking? booking = hotelService.findBookingById(idNumber, roomNumber);
        if (booking != null) {
          hotelService.showBookingDetails(booking);
        } else {
          print(" No booking found for Room $roomNumber and Customer ID: $idNumber.");
        }
        break;

      case '7':
        print("Exiting Admin Panel...");
        return;

      default:
        print("Invalid option. Please select from 1 to 7.");
    }
  }
}