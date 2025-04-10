import 'customer.dart';
import 'room.dart';

class Booking {
  Customer customer;
  Room room;
  int numberOfNights;
  double totalPrice;
  DateTime date;

  Booking(this.customer, this.room, this.numberOfNights)
      : totalPrice = room.pricePerNight * numberOfNights,
        date = DateTime.now();

  @override
  String toString() {
    return "Booking: $customer booked Room ${room.roomNumber} for $numberOfNights nights at \$${totalPrice.toStringAsFixed(2)} on $date";
  }
}