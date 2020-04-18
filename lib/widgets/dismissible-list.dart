import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  final String title;
  final List<Widget> items;

  DismissibleList({this.title, this.items});

  @override
  _DismissibleListState createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          title: Text('${this.widget.title}'),
          backgroundColor: Color(0xffffc439),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Dismissible(
                key: ObjectKey(this.widget.items[index]),
                child: this.widget.items[index],
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    this.widget.items.removeAt(index);
                  });
                },
                background: Container(
                  color: const Color.fromRGBO(183, 28, 28, 0.8),
                  child: const ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 22.0,
                      ),
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: const Color.fromRGBO(0, 96, 100, 0.8),
                  child: const ListTile(
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 22.0,
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: this.widget.items.length,
          ),
        ),
      ],
    );
  }
}
