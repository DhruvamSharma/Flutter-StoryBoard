import 'package:flutter/material.dart';
import 'package:storyboard/utils/list_item_widget.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';
import 'package:storyboard/widget_showcase/widget_showcase_page.dart';

class WidgetLibrarySublist extends StatefulWidget {
  final String widgetLibraryTitle;

  WidgetLibrarySublist(this.widgetLibraryTitle);

  @override
  _WidgetLibrarySublistState createState() => _WidgetLibrarySublistState();
}

class _WidgetLibrarySublistState extends State<WidgetLibrarySublist> {
  List<String> widgetSublistHeading = List();

  @override
  void initState() {
    super.initState();
    WidgetListData.getMapFromKey(widget.widgetLibraryTitle).keys
        .forEach((it) {
      widgetSublistHeading.add(it);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...widgetSublistHeading.map((it) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                navigateToShowcasePage(
                  widget.widgetLibraryTitle,
                  it,
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 8),
                child: ListItemWidget(it),
              ),
            ),
          );
        }),
      ],
    );
  }

  void navigateToShowcasePage(String widgetLibraryTitle, String sublistKey) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return WidgetShowcasePage(
        widgetLibraryTitle: widgetLibraryTitle,
        sublistKey: sublistKey,
      );
    }));
  }
}
