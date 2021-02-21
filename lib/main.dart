import 'package:flutter/material.dart';
import 'package:login_ui/Screens/Login/login_screen.dart';
import 'package:login_ui/helpers/data_pass_controller.dart';
import './constant.dart';
import './Screens/welcome/welcome_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './helpers/http_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<bool> get jwtOrEmpty async {
    var jwt = await storage.read(key: "refreshToken");
    if (jwt == null) return false;
    // print('refresh token from storage is $jwt');
    return HttpService.getAccessToken(jwt);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthy Being App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FutureBuilder(
          future: jwtOrEmpty,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            if (!snapshot.data) {
              return WelcomeScreen();
            } else {
              return Scaffold(
                  body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logged In',
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        storage.deleteAll().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                          MyController.showError(
                              context, 'Logged out successfully!');
                        });
                      },
                      child: Text('Logout'))
                ],
              ));
            }
          }),
    );
  }
}
