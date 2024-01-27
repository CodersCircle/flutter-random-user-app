import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user/Models/users_model.dart';

class UserApi {
  String  baseUrl = "https://randomuser.me/api/";

  UserApi._();
  static final UserApi userApi = UserApi._();
  Future<User?> fetchUsersApi() async {
    String url = baseUrl;
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeData = jsonDecode(response.body);
      User user = User.fromJSON(json: decodeData);
      return user;
    }
    return null;
  }
}
