import '../models/room.dart';

void addRoom(List<Room> rooms, Room room) {
  rooms.add(room);
  print("Room ${room.roomNumber} added.");
}