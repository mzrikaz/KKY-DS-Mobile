import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

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
