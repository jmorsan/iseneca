import 'dart:convert';

import 'package:iseneca/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  List<User> usersList = [];

  UsersProvider() {
    _getJsonData();
  }

  Future<List<User>> _getJsonData() async {
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyaPGHuEiF44vS-ql_RY7MbNVMDFRgwnvRjTu-aY4AhVhstT2CxMb7h3Z3Ljo8BAGhk/exec?spreadsheetId=1yF7DcKywQ3iGa37RoV47WJGLhoTjezQD8H3fjcoHUKo&sheet=usuarios');

    // Await the http get response, then decode the json-formatted response.
    final data = await http.get(url);
    dynamic jsonAppData = jsonDecode(data.body);

    for (dynamic data in jsonAppData) {
      User user = User(
        id: data['id'],
        usuario: data['usuario'],
        clave: data['clave'],
      );
      usersList.add(user);
    }
    //print(user);
    return usersList;
  }
}
