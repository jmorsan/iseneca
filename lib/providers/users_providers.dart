import 'package:iseneca/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  

  List<User> users  = [];
  


  UsersProvider() {
    getUsers();
    
  }

  Future<String> _getJsonData() async {
    var url = Uri.parse('https://script.google.com/macros/s/AKfycbyaPGHuEiF44vS-ql_RY7MbNVMDFRgwnvRjTu-aY4AhVhstT2CxMb7h3Z3Ljo8BAGhk/exec?spreadsheetId=1yF7DcKywQ3iGa37RoV47WJGLhoTjezQD8H3fjcoHUKo&sheet=usuarios');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    print(response.body);
    return response.body;
  }

  getUsers() async {
    
    final jsonData = await _getJsonData();

    final usuario = User.fromJson(jsonData);
  }


}