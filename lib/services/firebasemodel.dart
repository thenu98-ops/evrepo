class Profile {
  String? id; // Optional, Firestore document ID
  String email;
  String firstName;
  String lastName;
  String mobile;
  String address;
  String city;
  int balance;
  int energyKw;
  bool isCharging;

  Profile({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.address,
    required this.city,
    required this.balance,
    required this.energyKw,
    required this.isCharging
  });

  // Convert Profile to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "address": address,
      "city": city,
      "balance": balance,
      "energyKw": energyKw,
      "isCharging": isCharging
    };
  }

  // Create Profile object from Firestore document
  factory Profile.fromJson(Map<String, dynamic> json, String id) {
    return Profile(
      id: id,
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      mobile: json["mobile"],
      address: json["address"],
      city: json["city"],
      balance: json["balance"] ?? 0,
      energyKw: json["energyKw"]??0,
       isCharging: json['isCharging'],
    );
  }
}
