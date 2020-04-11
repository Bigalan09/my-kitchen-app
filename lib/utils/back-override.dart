import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackOverrideWidget extends StatefulWidget {
  /// A wrapper widget to require two back button presses to exit.
  const BackOverrideWidget({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _BackOverrideWidgetState createState() => _BackOverrideWidgetState();
}

class _BackOverrideWidgetState extends State<BackOverrideWidget> {
  Timer timer;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (!Navigator.canPop(context) && timer == null) {
            // Show a snackbar message
            Scaffold.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 2),
                content: Text('Press back again to exit')));
            // Set the timer
            timer = Timer(const Duration(seconds: 2), () => timer = null);
            // Return false to prevent the app from closing
            return false;
          } else {
            return true;
          }
        },
        child: widget.child,
      );
}
