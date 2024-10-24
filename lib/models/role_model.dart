import 'package:flutter/material.dart';

class RoleModel {
  const RoleModel({required this.name, required this.color});

  final String name;
  final Color color;

  copyWith({
    String? name,
    Color? color
  }) {
    return RoleModel(
      name: name ?? this.name,
      color: color ?? this.color
    );
  }
}