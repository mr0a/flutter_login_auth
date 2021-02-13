import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  final String url = "http://10.0.2.2:8000/api/user/create";

  Future<String> CreateUser(String email, String pass) async {
    var match = {"email": email, "password": pass};
    print('$email $pass');
    Response response = await post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: json.encode(match),
        encoding: Encoding.getByName("utf-8"));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(body);
      return 'Success';
    } else {
      throw "Can't get posts.";
    }
  }

  Future<Map<String, dynamic>> createUser(String email, String password) async {
    Response response = await post(
      Uri.parse('http://10.0.2.2:8000/api/user/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    // print(List.from(jso));
    if (response.statusCode == 201) {
      return {'msg': 'Account Created Successfully', 'error': false};
    }
    String res = jsonDecode(response.body)['email'][0];
    return {'msg': res, 'error': true};
  }
}

void main() {
  var hel = HttpService();
  var res = hel.createUser('demo@demo.com', '0000');
  // hel.createAlbum('demo');
}
