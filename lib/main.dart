import 'dart:io';
import 'admin_menu.dart';
import 'customer_menu.dart';
import 'models/room.dart';
import 'models/booking.dart';

void main() {
  List<Room> rooms = []; // قايمة الغرف
  List<Booking> bookings = []; // قايمة الحجوزات

  while (true) {
    print("\nWelcome to Hotel Booking System");
    print("1. Admin Panel");
    print("2. Customer Panel");
    print("3. Exit");

    stdout.write("Select an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        adminMenu(rooms, bookings);
        break;
      case '2':
        customerMenu(rooms, bookings); 
        break;
      case '3':
        print("Exiting...");
        return;
      default:
        print("Invalid option.");
    }
  }
}