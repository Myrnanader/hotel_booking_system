import '../models/room.dart';

Room? findRoomByNumber(List<Room> rooms, int roomNumber) {
  try {
    return rooms.firstWhere((room) => room.roomNumber == roomNumber);
  } catch (_) {
    print(" room $roomNumber not found");
    return null;
  }
}