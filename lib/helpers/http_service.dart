import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  final String createUserUrl = "http://10.0.2.2:8000/api/user/create";
  final String signInUrl = "http://10.0.2.2:8000/api/token/create";

  Future<Map<String, dynamic>> createUser(String email, String password) async {
    Response response = await post(
      Uri.parse(createUserUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    print(response.body);
    if (response.statusCode == 201) {
      return {'msg': 'Account Created Successfully', 'error': false};
    }
    String res = jsonDecode(response.body)['email'][0];
    return {'msg': res, 'error': true};
  }

  Future<Map<String, dynamic>> signInUser(String email, String password) async {
    Response response = await post(Uri.parse(signInUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));
    return jsonDecode(response.body);
  }
}

void main() {
  // var hel = HttpService();
  // var res = hel.createUser('demo@demo.com', '0000');
  // hel.createAlbum('demo');
}
