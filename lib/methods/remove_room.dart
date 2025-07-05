import '../models/room.dart';

void removeRoom(List<Room> rooms, int roomNumber) {
  rooms.removeWhere((room) => room.roomNumber == roomNumber);
  print(" room $roomNumber removed successfully");
}