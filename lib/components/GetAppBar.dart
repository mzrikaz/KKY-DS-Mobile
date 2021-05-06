import 'package:flutter/material.dart';
import 'package:kky_ds/constants.dart';

class GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const GetAppBar({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      shadowColor: kPrimaryColor.withOpacity(0.5),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              title,
              style: TextStyle(color: kPrimaryTextColor),
            ),
          ),
        ],
      ),
      backgroundColor: kTertiaryColor,
    );
  }
}
