import 'package:flutter/material.dart';
import 'package:kky_ds/models/GNDivision.dart' show GNDivisionProvider;
import 'package:kky_ds/models/SDODivision.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SamurdhiScreen extends StatefulWidget {
  @override
  _SamurdhiScreenState createState() => _SamurdhiScreenState();
}

class _SamurdhiScreenState extends State<SamurdhiScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<SDODivisionProvider>(context).fetchAndUpdateList().then((_) {
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
      appBar: AppBar(
        title: FittedBox(
          child: const Text('சமுர்த்தி உத்தியோகத்தர்கள்'),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (_, size) {
                return Consumer<SDODivisionProvider>(
                  builder: (_, divisions, __) => ListView.builder(
                    itemCount: divisions.gnDivisions.length,
                    itemBuilder: (_, i) {
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(3),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: (divisions.gnDivisions[i].image != '-')
                                ? Image.network(divisions.gnDivisions[i].image)
                                : Image.asset(
                                    'assets/images/dummy_${divisions.gnDivisions[i].gender.toLowerCase()}.jpg'),
                          ),
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
