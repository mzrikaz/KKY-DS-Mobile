import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowHtml.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final String title, incharge, phone, contents;

  const ServiceDetailsScreen(
      {Key key, this.title, this.incharge, this.phone, this.contents})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'சேவை விவரம்',
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: ShowHtml(
          title: title,
          contents: contents,
        ),
      ),
      bottomSheet: incharge != "-"
          ? Incharge(incharge: incharge, phone: phone)
          : SizedBox.shrink(),
    );
  }
}

class Incharge extends StatelessWidget {
  const Incharge({
    Key key,
    @required this.incharge,
    @required this.phone,
  }) : super(key: key);

  final String incharge;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'பொ.அ:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
            child: Text(
              incharge,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[900],
              ),
            ),
          ),
          (phone != "-")
              ? IconButton(
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  splashColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    launch('tel:$phone');
                  },
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
