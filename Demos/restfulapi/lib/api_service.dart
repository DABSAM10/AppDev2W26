import 'dart:developer';

import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'constants.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(Apiconstants.baseURL + Apiconstants.userEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
