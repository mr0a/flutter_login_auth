import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/main_top.png',
            ),
            width: size.width * 0.4,
          )
        ],
      ),
    );
  }
}
