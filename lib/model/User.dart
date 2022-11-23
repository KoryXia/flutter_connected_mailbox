
User userFromJson(Map<String, dynamic> str) => User.fromJson(str);

class User {
  User({
    this.data,
  });

  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    this.userId,
    this.name,
    this.address,
    this.room,
    this.phone,
    this.city,
    this.country,
    this.postalCode,
    this.email,
  });

  String? userId;
  String? name;
  String? address;
  String? room;
  String? phone;
  String? city;
  String? country;
  String? postalCode;
  String? email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    name: json["name"],
    address: json["address"],
    room: json["room"],
    phone: json["phone"],
    city: json["city"],
    country: json["country"],
    postalCode: json["postalCode"],
    email: json["email"],
  );
}
