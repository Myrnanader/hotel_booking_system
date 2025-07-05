class Customer {
  String name;
  String email;
  String phoneNumber;
  String idNumber;
  DateTime registrationDate;

  Customer({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.idNumber,
  }) : registrationDate = DateTime.now();

  @override
  String toString() {
    return "Customer: $name | Email: $email | Phone: $phoneNumber | ID: $idNumber | Registered: $registrationDate";
  }
}