import 'package:flutter/material.dart';

/// This file is a controller for all the items in a list.
/// This is used to control the appearance of the sublist.
class ListItemWidget extends StatelessWidget {
  final String title;
  ListItemWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.subhead,);
  }
}
