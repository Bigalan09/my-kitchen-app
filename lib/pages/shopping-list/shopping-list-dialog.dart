import 'package:flutter/material.dart';

class ShoppingListDialog extends StatefulWidget {
  final String title, description, buttonText;
  final Image image;
  final double _padding = 16.0;
  final double _avatarRadius = 42.0;

  ShoppingListDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  _ShoppingListDialogState createState() => _ShoppingListDialogState();
}

class _ShoppingListDialogState extends State<ShoppingListDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.widget._padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: widget._avatarRadius + widget._padding,
            bottom: widget._padding,
            left: widget._padding,
            right: widget._padding,
          ),
          margin: EdgeInsets.only(top: widget._avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(widget._padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(widget.buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: widget._padding,
          right: widget._padding,
          child: CircleAvatar(
            backgroundColor: Color(0xff93B56C),
            radius: widget._avatarRadius,
          ),
        ),
      ],
    );
  }
}
