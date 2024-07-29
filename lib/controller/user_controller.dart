import 'package:http/http.dart' as http;
import "dart:convert";

import 'package:teste/models/user_model.dart';

class UserController {
  Future<String> signUp(UserModel user) async {
    try {
      final response = await http.post(
          Uri.parse("https://projeto-software-cotemig.vercel.app/user"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": user.name,
            "email": user.email,
            "password": user.password,
          }));

      final data = json.decode(response.body);

      if (response.statusCode == 201) {
        return "Cadastrado";
      } else {
        return data["message"] as String;
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
