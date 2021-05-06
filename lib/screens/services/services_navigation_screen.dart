import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowSubNavigationItem.dart';
import 'package:kky_ds/models/ServiceDepartment.dart';
import 'package:kky_ds/screens/services/services_list_screen.dart';
import 'package:provider/provider.dart';

class ServicesNavigationScreen extends StatefulWidget {
  @override
  _ServicesNavigationScreenState createState() =>
      _ServicesNavigationScreenState();
}

class _ServicesNavigationScreenState extends State<ServicesNavigationScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ServicesDepartmentsProvider>(context)
          .fetchAndUpdateList()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'சேவை பிரிவுகள்',
      ),
      body: _isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
              color: Colors.white,
            )
          : Container(
              color: Colors.white,
              child: Consumer<ServicesDepartmentsProvider>(
                builder: (_, service, __) => service.services.length <= 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: const Text(
                            'இந்தப் பகுதியில் சேவை பிரிவுகள் எதுவும் பதியப்படவில்லை.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          itemCount: service.services.length,
                          itemBuilder: (_, i) {
                            return ShowSubNavigationItem(
                              title: service.services[i].sheetName,
                              route: () => {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return ServicesListScreen(
                                    sheetId: service.services[i].sheetID,
                                    sheetName: service.services[i].sheetName,
                                  );
                                }))
                              },
                            );
                          },
                        ),
                      ),
              ),
            ),
    );
  }
}
