import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * 0.1,
            child: Image.asset('assets/image/logo.png'),
          ),
          Positioned(
            height: size.height * 0.7,
            bottom: 0,
            child: Image.asset('assets/image/background_green.png'),
          ),
          child,
        ],
      ),
    );
  }
}
