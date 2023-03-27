import 'dart:convert';

import 'package:http/http.dart';
import 'package:user_app/models/user_model.dart';

class UserRepository {
  String uri = "https://jsonplaceholder.typicode.com";

  Future<Map<String, dynamic>> getUsers() async {
    Response response = await get(Uri.parse('$uri/users/1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> user = jsonDecode(response.body);

      return user;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
