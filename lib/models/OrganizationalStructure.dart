import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class OrganizationalStructure {
  final String sheetName, sheetID;

  const OrganizationalStructure({
    @required this.sheetName,
    @required this.sheetID,
  });
}

class OrganizationalStructureProvider with ChangeNotifier {
  List<OrganizationalStructure> _serviceList = [];

  List<OrganizationalStructure> get services {
    return [..._serviceList];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1KpiDveVnBwMVYf4Y_tG6yMBGh_yvmiS3eQPuyXi88eM',
              sheetName: 'DIVISIONS')
          .sheetData();
      final List<OrganizationalStructure> loadedItems = [];
      for (var i = 1; i < values.length; i++) {
        loadedItems.add(
          OrganizationalStructure(
            sheetName: values[i][0].toString().trim(),
            sheetID: '1KpiDveVnBwMVYf4Y_tG6yMBGh_yvmiS3eQPuyXi88eM',
          ),
        );
      }
      _serviceList = loadedItems;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
