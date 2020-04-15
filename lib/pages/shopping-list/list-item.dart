import 'package:flutter/material.dart';

class ShoppingListItem extends StatefulWidget {
  final String title;
  final String quantity;

  ShoppingListItem({@required this.title, @required this.quantity});

  @override
  _ShoppingListItemState createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      onChanged: (newVal) {
        setState(() {
          checked = newVal;
        });
      },
      title: Text(
        this.widget.title,
        style: TextStyle(
          decoration:
              checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        this.widget.quantity,
        style: TextStyle(
          decoration:
              checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
