import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class StaffListItem extends StatelessWidget {
  final String name, image, division, gender, phone;
  const StaffListItem({
    Key key,
    @required this.name,
    this.image,
    this.division,
    this.gender,
    this.phone,
  }) : super(key: key);

  // This is used for ListItems in Pages like About, Administration, Services and etc

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: image == "-"
                  ? Image.asset(
                      'assets/images/dummy_${gender.toLowerCase()}.jpg')
                  : Image.network(image),
              title: Text(
                name,
                softWrap: true,
              ),
              subtitle: Text(
                division,
                softWrap: true,
              ),
              trailing: phone != "-"
                  ? IconButton(
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        launch('tel:$phone');
                      },
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
