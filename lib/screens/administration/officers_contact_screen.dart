import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/database/administrative_divisions.dart';
import 'package:kky_ds/screens/development_screen.dart';
import 'package:kky_ds/screens/gn_screen.dart';
import 'package:kky_ds/screens/registrar_screen.dart';
import 'package:kky_ds/screens/samurdhi_screen.dart';

import '../field_officer_screen.dart';

class OfficersContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'அதிகாரிகள் தொடர்புத் திரட்டு',
      ),
      body: LayoutBuilder(
        builder: (_, size) => Container(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              // SliverList(
              //   delegate: SliverChildListDelegate([
              //     Container(
              //       width: size.maxWidth,
              //       padding: const EdgeInsets.all(25),
              //       child: const Text(
              //         'Administrative Structure',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ]),
              // ),
              SliverList(
                delegate: SliverChildListDelegate(ADMINISTRATIVE_DIVISIONS
                    .map(
                      (division) => GestureDetector(
                        onTap: () {
                          switch (division.id) {
                            case 1:
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => GNScreen()));
                              break;
                            case 2:
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SamurdhiScreen()));
                              break;
                            case 3:
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => DevelopmentScreen()));
                              break;
                            case 4:
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => RegistrarScreen()));
                              break;
                            case 5:
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => FieldOfficerScreen()));
                              break;
                            default:
                              return;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1 / 3,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 80,
                                child: Image.asset(
                                  division.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  division.name,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                    .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
