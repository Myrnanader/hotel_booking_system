import 'dart:io';
import 'models/booking.dart';
import 'models/customer.dart';
import 'models/room.dart';
import 'services/hotel_service.dart';

void customerMenu(List<Room> rooms, List<Booking> bookings) {
  HotelService hotelService = HotelService();
  hotelService.rooms = rooms;
  hotelService.bookings = bookings;

  while (true) {
    print("\n========== Customer Panel ==========");
    print("1. View available rooms");
    print("2. Book a room");
    print("3. Cancel a booking");
    print("4. View booking details");
    print("5. Exit");

    stdout.write("Select an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        List<Room> availableRooms = hotelService.getRoomsAvailable();
        if (availableRooms.isEmpty) {
          print(" No rooms available.");
        } else {
          print(" Available Rooms:");
          for (var room in availableRooms) {
            print(room);
          }
        }
        break;

      case '2':
        stdout.write("Enter room number to book: ");
        int roomNumber = int.parse(stdin.readLineSync()!);

        stdout.write("Enter your name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter your email: ");
        String email = stdin.readLineSync()!;
        stdout.write("Enter your phone number: ");
        String phone = stdin.readLineSync()!;
        stdout.write("Enter your ID number: ");
        String id = stdin.readLineSync()!;
        stdout.write("Enter number of nights: ");
        int nights = int.parse(stdin.readLineSync()!);

        Room? room = hotelService.findRoom(roomNumber);
        if (room != null) {
          Customer customer = Customer(
            name: name,
            email: email,
            phoneNumber: phone,
            idNumber: id,
          );
          hotelService.book(room, customer, nights);
        } else {
          print(" Room not found or already booked.");
        }
        break;
      case '3':
        stdout.write("Enter your ID number: ");
        String id = stdin.readLineSync()!;
        stdout.write("Enter room number to cancel booking: ");
        int roomNumber = int.parse(stdin.readLineSync()!);

        bool cancelled = hotelService.cancelByCustomer(id, roomNumber);
        if (!cancelled) {
          print(" No booking found with the provided ID and room number.");
        }
        break;

      case '4':
        stdout.write("Enter your ID number: ");
        String id = stdin.readLineSync()!;
        stdout.write("Enter room number to view booking details: ");
        int roomNumber = int.parse(stdin.readLineSync()!);

        Booking? booking = hotelService.findBookingById(id, roomNumber);
        if (booking != null) {
          hotelService.showBookingDetails(booking);
        } else {
          print(" No booking found for Room $roomNumber and your ID: $id.");
        }
        break;

      case '5':
        print("Exiting Customer Panel...");
        return;

      default:
        print("Invalid option. Please choose from 1 to 5");
    }
  }
}