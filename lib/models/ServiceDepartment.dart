import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class ServiceDepartment {
  final String sheetName, sheetID;

  const ServiceDepartment({
    @required this.sheetName,
    @required this.sheetID,
  });
}

class ServicesDepartmentsProvider with ChangeNotifier {
  List<ServiceDepartment> _serviceList = [];

  List<ServiceDepartment> get services {
    return [..._serviceList];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1fBME7WWHCBVu2O_0RUP5V72fWRtAt3cnxVlIvsIkahY',
              sheetName: 'DEPARTMENTS')
          .sheetData();
      final List<ServiceDepartment> loadedItems = [];
      for (var i = 1; i < values.length; i++) {
        loadedItems.add(
          ServiceDepartment(
            sheetName: values[i][0].toString().trim(),
            sheetID: '1fBME7WWHCBVu2O_0RUP5V72fWRtAt3cnxVlIvsIkahY',
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
