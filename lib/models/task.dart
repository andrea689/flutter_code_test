import 'package:meta/meta.dart';
import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String body;
  final bool checked;
  final int points;
  final String type;
  final bool enabled;

  Task({
    this.id,
    @required this.title,
    @required this.body,
    @required this.checked,
    @required this.points,
    @required this.type,
    @required this.enabled,
  });

  Task copyWith({
    String id,
    String title,
    String body,
    bool checked,
    int points,
    String type,
    bool enabled,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        checked: checked ?? this.checked,
        points: points ?? this.points,
        type: type ?? this.type,
        enabled: enabled ?? this.enabled,
      );

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        checked: json["checked"] == null ? null : json["checked"],
        points: json["points"] == null ? null : json["points"],
        type: json["type"] == null ? null : json["type"],
        enabled: json["enabled"] == null ? null : json["enabled"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "checked": checked == null ? null : checked,
        "points": points == null ? null : points,
        "type": type == null ? null : type,
        "enabled": enabled == null ? null : enabled,
      };
}
