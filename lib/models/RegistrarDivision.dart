import 'package:flutter/foundation.dart';
import 'package:kky_ds/helper/GoogleSheetsApi.dart';

class RegistrarDivision {
  final String divisionName, gnName, phone, gender, image;

  const RegistrarDivision({
    @required this.phone,
    @required this.divisionName,
    @required this.gnName,
    @required this.gender,
    this.image,
  });
}

class RegistrarDivisionProvider with ChangeNotifier {
  List<RegistrarDivision> _list = [];

  List<RegistrarDivision> get gnDivisions {
    return [..._list];
  }

  Future<void> fetchAndUpdateList() async {
    try {
      final values = await GoogleSheets(
              sheetId: '1KpiDveVnBwMVYf4Y_tG6yMBGh_yvmiS3eQPuyXi88eM',
              sheetName: 'Registrar')
          .sheetData();
      final List<RegistrarDivision> loadedProducts = [];
      for (var i = 1; i < values.length; i++) {
        loadedProducts.add(
          RegistrarDivision(
            gnName: values[i][0],
            gender: values[i][1],
            divisionName: values[i][2],
            phone: values[i][3],
            image: values[i][4],
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
