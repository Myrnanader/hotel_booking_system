import 'dart:io';
import 'models/room.dart';
import 'models/customer.dart';
import 'models/booking.dart';
import 'services/hotel_service.dart';

void customerMenu(List<Room> rooms, List<Booking> bookings) {
  HotelService hotelService = HotelService();
  hotelService.rooms = rooms;
  hotelService.bookings = bookings;

  while (true) {
    print("\nCustomer Panel");
    print("1. View available rooms");
    print("2. Book a room");
    print("3. Cancel a booking");
    print("4. View booking details");
    print("5. Exit");
    

    stdout.write("Select an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1': // عرض الغرف المتاحة
        List<Room> availableRooms = hotelService.getAvailableRooms();
        if (availableRooms.isEmpty) {
          print("No rooms available.");
        } else {
          for (var room in availableRooms) {
            print(room);
          }
        }
        break;

      case '2': // حجز غرفة
        stdout.write("Enter room number to book: ");
        int roomNumber = int.parse(stdin.readLineSync()!);
        stdout.write("Enter your name: ");
        String customerName = stdin.readLineSync()!;
        stdout.write("Enter number of nights: ");
        int numberOfNights = int.parse(stdin.readLineSync()!);

        try {
          Room room = hotelService.findRoomByNumber(roomNumber)!;
          Customer customer = Customer(customerName);
          hotelService.bookRoom(customer, room, numberOfNights);
        } catch (e) {
          print("Room not found or already booked.");
        }
        break;

      case '3': // إلغاء حجز
        stdout.write("Enter your name: ");
        String customerName = stdin.readLineSync()!;
        stdout.write("Enter room number to cancel booking: ");
        int roomNumberToCancel = int.parse(stdin.readLineSync()!);

        Booking? booking =
            hotelService.findBookingByRoomNumber(roomNumberToCancel);
        if (booking != null && booking.customer.name == customerName) {
          hotelService.cancelBooking(booking);
        } else {
          print(
              "No booking found for Room $roomNumberToCancel under the name $customerName.");
        }
        break;

      case '4': //تفاصيل الحجز
        stdout.write("Enter your name: ");
        String customerName = stdin.readLineSync()!;
        stdout.write("Enter room number to view booking details: ");
        int roomNumberToView = int.parse(stdin.readLineSync()!);

        Booking? booking =
            hotelService.findBookingByRoomNumber(roomNumberToView);
        if (booking != null && booking.customer.name == customerName) {
          hotelService.viewBookingDetails(booking);
        } else {
          print(
              "No booking found for Room $roomNumberToView under the name $customerName.");
        }
        break;
      case '5':
        print("Exiting Customer Panel...");
        return;
      default:
        print("Invalid option.");
    }
  }
}
