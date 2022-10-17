import 'package:flutter/material.dart';

class Project {
  int? id;
  final String name;
  final Color color;

  Project({this.id, required this.name, required this.color});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(id: json['id'], name: json['name'], color: json['color']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'color': color
  };
}
