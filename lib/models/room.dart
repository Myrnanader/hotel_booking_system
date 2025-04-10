class Room {
  int roomNumber;
  double pricePerNight;
  bool isBooked;

  Room(this.roomNumber, this.pricePerNight, {this.isBooked = false});

  @override
  String toString() {
    return "Room $roomNumber - \$${pricePerNight.toStringAsFixed(2)} per night - ${isBooked ? 'Booked' : 'Available'}";
  }
}