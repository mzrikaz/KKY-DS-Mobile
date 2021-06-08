import 'package:flutter/material.dart';
import 'package:kky_ds/components/GetAppBar.dart';
import 'package:kky_ds/components/StaffListItem.dart';
import 'package:kky_ds/models/Staff.dart' show StaffProvider;
import 'package:provider/provider.dart';

class StaffListScreen extends StatefulWidget {
  final String sheetId, sheetName;

  const StaffListScreen({Key key, this.sheetId, this.sheetName})
      : super(key: key);
  @override
  _StaffListScreenState createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<StaffProvider>(context)
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
          : Consumer<StaffProvider>(
              builder: (_, staff, __) => staff.staffs.length <= 0
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
                      itemCount: staff.staffs.length,
                      itemBuilder: (_, i) {
                        return StaffListItem(
                          name: staff.staffs[i].name,
                          image: staff.staffs[i].image,
                          division: staff.staffs[i].division,
                          gender: staff.staffs[i].gender,
                          phone: staff.staffs[i].phone,
                        );
                      },
                    ),
            ),
    );
  }
}
