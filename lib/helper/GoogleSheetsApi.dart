import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GoogleSheets {
  final String apiKey, sheetId, sheetName;

  const GoogleSheets({
    // API Key Obtained in Google Cloud Console
    this.apiKey = 'AIzaSyCtIkGcfnMmiN1Yp6OrJg-zHE9USRdw85o',
    // Name visible on Google SpreadSheet
    @required this.sheetName,
    // This is the unique id of every main sheet in google sheets
    @required this.sheetId,
  });

  Future<List> sheetData() async {
    // Google Sheet API URL
    final url = Uri.parse(
        'https://sheets.googleapis.com/v4/spreadsheets/${this.sheetId}/values/${this.sheetName}?key=${this.apiKey}');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // All column and row datas of spreadsheets are wrap inside `values` array
      return extractedData['values'];
    } catch (e) {
      throw (e);
    }
  }
}
