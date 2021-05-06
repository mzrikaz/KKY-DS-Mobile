import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/ShowSubNavigationItem.dart';
import 'package:kky_ds/models/Service.dart' show ServicesProvider;
import 'package:kky_ds/screens/services/service_details_screen.dart';
import 'package:provider/provider.dart';

class ServicesListScreen extends StatefulWidget {
  final String sheetId, sheetName;

  const ServicesListScreen({Key key, this.sheetId, this.sheetName})
      : super(key: key);
  @override
  _ServicesListScreenState createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ServicesProvider>(context)
          .fetchAndUpdateList(
        sheetId: widget.sheetId,
        sheetName: widget.sheetName,
      )
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
        title: widget.sheetName,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<ServicesProvider>(
              builder: (_, service, __) => service.services.length <= 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: const Text(
                          'இந்தப் பகுதியில் சேவை விவரங்கள் எதுவும் பதியப்படவில்லை.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: service.services.length,
                      itemBuilder: (_, i) {
                        return ShowSubNavigationItem(
                          title: service.services[i].title,
                          route: () => {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return ServiceDetailsScreen(
                                title: service.services[i].title,
                                contents: service.services[i].contents,
                                incharge: service.services[i].incharge,
                                phone: service.services[i].phone,
                              );
                            }))
                          },
                        );
                      },
                    ),
            ),
    );
  }
}
