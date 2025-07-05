import '../models/room.dart';

List<Room> getAvailableRooms(List<Room> rooms) {
  return rooms.where((room) => !room.isBooked).toList();
}