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
      () => Navigator.pushReplacement(
        context,
        PageFadeTransition(
          child: nextPage,
          duration: const Duration(
            seconds: 1,
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
          child: Center(
            child: Hero(
              tag: 'logo',
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 250,
                width: 250,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
