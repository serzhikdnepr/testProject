import 'package:test_project/utils/utils.dart';

class Item {
  final int? id;
  final String title;
  final String descriptions;
  final String time;
  final String date;
  final String userEmail;

  const Item({
    this.id,
    required this.title,
    required this.descriptions,
    required this.time,
    required this.date,
    required this.userEmail,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ItemKeys.id: id,
      ItemKeys.title: title,
      ItemKeys.descriptions: descriptions,
      ItemKeys.time: time,
      ItemKeys.date: date,
      ItemKeys.userEmail: userEmail

    };
  }

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      id: map[ItemKeys.id],
      title: map[ItemKeys.title],
      descriptions: map[ItemKeys.descriptions],
      time: map[ItemKeys.time],
      date: map[ItemKeys.date],
      userEmail: map[ItemKeys.userEmail],
    );
  }

  Item copyWith({
    int? id,
    String? title,
    String? descriptions,
    String? time,
    String? date,
    String? userEmail
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      descriptions: descriptions ?? this.descriptions,
      time: time ?? this.time,
      date: date ?? this.date,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}
