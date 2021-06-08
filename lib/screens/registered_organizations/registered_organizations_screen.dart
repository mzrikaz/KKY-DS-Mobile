import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/models/RegisteredOrganization.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisteredOrganizationScreen extends StatefulWidget {
  @override
  _RegisteredOrganizationScreenState createState() =>
      _RegisteredOrganizationScreenState();
}

class _RegisteredOrganizationScreenState
    extends State<RegisteredOrganizationScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<RegisteredOrganizationProvider>(context)
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
        title: 'பதியப்பட்ட நிறுவனங்கள்',
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (_, size) {
                return Consumer<RegisteredOrganizationProvider>(
                  builder: (_, divisions, __) => ListView.builder(
                    itemCount: divisions.gnDivisions.length,
                    itemBuilder: (_, i) {
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(3),
                          title: Text(
                            divisions.gnDivisions[i].gnName,
                          ),
                          subtitle: Text(divisions.gnDivisions[i].divisionName),
                          trailing: FittedBox(
                            child: Row(
                              children: [
                                size.maxWidth >= 500
                                    ? SizedBox(width: 5)
                                    : SizedBox.shrink(),
                                size.maxWidth >= 500
                                    ? ElevatedButton(
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.call),
                                              onPressed: () {
                                                launch(
                                                    'tel:${divisions.gnDivisions[i].phone}');
                                              },
                                            ),
                                            const Text('CALL'),
                                          ],
                                        ),
                                        onPressed: () {},
                                      )
                                    : IconButton(
                                        color: Colors.green,
                                        icon: const Icon(Icons.call),
                                        onPressed: () {
                                          launch(
                                              'tel:${divisions.gnDivisions[i].phone}');
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
