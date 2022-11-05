// To parse this JSON data, do
//
//     final mailboxes = mailboxesFromJson(jsonString);


MailboxList mailboxListFromJson(Map<String, dynamic> data) => MailboxList.fromJson(data);

class MailboxList {
  MailboxList({
    this.data,
  });

  List<Data>? data;

  factory MailboxList.fromJson(Map<String, dynamic> json) => MailboxList(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );
}

class Data {
  Data({
    required this.mailboxId,
    required this.interphoneId,
    required this.nickname,
    required this.userId,
    required this.gotNew,
    required this.screenInfo,
  });

  String? mailboxId;
  String? interphoneId;
  String? nickname;
  String? userId;
  bool? gotNew;
  String? screenInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mailboxId: json["mailboxId"],
    interphoneId: json["interphoneId"],
    nickname: json["nickname"],
    userId: json["userId"],
    gotNew: json["gotNew"],
    screenInfo: json["screenInfo"],
  );
}
