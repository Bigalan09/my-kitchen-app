import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_kitchen/utils/page-transitions.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextPage;

  SplashScreen({Key key, @required this.nextPage}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState(nextPage);
}

class _SplashScreenState extends State<SplashScreen> {
  Widget nextPage;

  _SplashScreenState(this.nextPage);

  @override
  void initState() {
    Future<void>.delayed(
      const Duration(
        seconds: 1,
      ),
      () => Navigator.of(context).pushReplacement(
        PageFadeTransition(
          child: nextPage,
          duration: const Duration(
            milliseconds: 750,
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            color: Theme.of(context).accentColor,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
