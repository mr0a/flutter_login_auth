import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:login_ui/Screens/SignUp/signup_screen.dart';
import 'package:login_ui/components/already_have_an_account.dart';
import 'package:login_ui/components/rounded_button.dart';
import '../../../components/rounded_password_field.dart';
import '../../../components/rounded_input_field.dart';
import './background.dart';
import '../../../helpers/data_pass_controller.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String get username => _dataController.text;
  String get password => _passController.text;

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
                print('Username ${MyController.username}');
                print('Password ${MyController.password}');
                MyController.displayDialog(context, 'title', 'text');
              },
            ),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                return Navigator.push(
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
