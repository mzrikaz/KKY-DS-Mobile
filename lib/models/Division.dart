import 'package:flutter/material.dart';

class Division {
  final int id;
  final String name;
  final IconData icon;

  const Division({
    @required this.id,
    @required this.name,
    this.icon,
  });
}
