Letters lettersFromJson(Map<String, dynamic> data) => Letters.fromJson(data);

class Letters {
  Letters({
    this.data,
  });

  List<Data>? data;

  factory Letters.fromJson(Map<String, dynamic> json) => Letters(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );
}

class Data {
  Data({
    required this.letterId,
    required this.mailboxId,
    required this.dateTime,
  });

  String? letterId;
  String? mailboxId;
  DateTime? dateTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    letterId: json["letterId"].toString(),
    mailboxId: json["mailboxId"],
    dateTime: DateTime.parse(json["dateTime"]),
  );
}
