import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:login_ui/Screens/SignUp/signup_screen.dart';
import 'package:login_ui/components/already_have_an_account.dart';
import 'package:login_ui/components/rounded_button.dart';
import '../../../components/rounded_password_field.dart';
import '../../../components/rounded_input_field.dart';
import './background.dart';
import '../../../helpers/data_pass_controller.dart';
import '../../../helpers/http_service.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: 'Your Email',
              controller: MyController.dataController,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: MyController.passController,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                if (MyController.username.isEmpty ||
                    MyController.password.isEmpty) {
                  return MyController.showError(
                      context, 'Both Email and Password fields are required');
                }

                var user = HttpService();
                var res = user.signInUser(
                    MyController.username, MyController.password);
                res.then(
                  (value) {
                    print(value);
                    if (value.containsKey('refresh')) {
                      return Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            body: Text('Logged In'),
                          );
                        },
                      ), (route) => false);
                    } else if (value.containsKey('detail')) {
                      return MyController.showError(context, value['detail']);
                    }
                  },
                );
              },
            ),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                return Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
