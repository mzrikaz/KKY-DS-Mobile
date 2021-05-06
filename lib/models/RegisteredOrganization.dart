import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class RegisteredOrganization {
  final String divisionName, gnName, phone;

  const RegisteredOrganization({
    @required this.phone,
    @required this.divisionName,
    @required this.gnName,
  });
}

class RegisteredOrganizationProvider with ChangeNotifier {
  List<RegisteredOrganization> _list = [];

  List<RegisteredOrganization> get gnDivisions {
    return [..._list];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1tq_ARZOj-hK2DGIjoEpiOFzJPxUwzt2qw1zC7IPUa50',
              sheetName: 'ORG')
          .sheetData();
      final List<RegisteredOrganization> loadedProducts = [];
      for (var i = 1; i < values.length; i++) {
        loadedProducts.add(
          RegisteredOrganization(
            gnName: values[i][0],
            divisionName: values[i][1],
            phone: values[i][2],
          ),
        );
      }
      _list = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
