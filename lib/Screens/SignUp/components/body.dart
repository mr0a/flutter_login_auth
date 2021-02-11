import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './background.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';
import '../../../components/rounded_button.dart';
import 'package:login_ui/Screens/Login/login_screen.dart';
import 'package:login_ui/components/already_have_an_account.dart';

import 'or_divider.dart';
import 'social_icon.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key key,
    this.child,
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
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: 'Email',
            ),
            RoundedPasswordField(),
            // RoundedPasswordField(),
            RoundedButton(
              text: 'SignUp',
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  iconSrc: 'assets/icons/google-plus.svg',
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
