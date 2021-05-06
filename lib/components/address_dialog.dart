import 'package:flutter/material.dart';

class AddressDialog {
  static Future<void> show(
      BuildContext ctx, String name, String address) async {
    return showDialog(
        context: ctx,
        builder: (_) {
          return AlertDialog(
            title: Text(name),
            content: Text(address),
          );
        });
  }
}
