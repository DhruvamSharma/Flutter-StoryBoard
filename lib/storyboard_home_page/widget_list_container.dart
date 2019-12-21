import 'package:flutter/material.dart';
import 'package:storyboard/utils/colors.dart';
import 'package:storyboard/utils/list_item_widget.dart';
import './widget_library_sublist.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';

class WidgetListContainer extends StatefulWidget {
  final String widgetLibraryTitle;
  final IconData iconData;

  WidgetListContainer(this.iconData,
      {@required this.widgetLibraryTitle,});

  @override
  _WidgetListContainerState createState() => _WidgetListContainerState();
}

class _WidgetListContainerState extends State<WidgetListContainer> {
  double elevatedPadding = 18;
  double normalPadding = 0;
  bool isSelected = false;
  double heightOfContainer = 0;
  List<ListItemWidget> widgetSublistHeading = List();

  @override
  void initState() {
    super.initState();
    WidgetListData.getMapFromKey(widget.widgetLibraryTitle).keys.forEach((it) {
     widgetSublistHeading.add(ListItemWidget(it));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: AnimatedPadding(
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
        padding: isSelected
            ? EdgeInsets.all(normalPadding)
            : EdgeInsets.all(elevatedPadding),
        child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: ListTile(
              subtitle: AnimatedContainer(
                  height: isSelected ? 30.0 *  widgetSublistHeading.length: 0.0,
                  curve: Curves.ease,
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  child: isSelected
                      ? WidgetLibrarySublist(widget.widgetLibraryTitle)
                      : Container()),
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              title: Hero(
                tag: widget.widgetLibraryTitle,
                child: Text(
                  widget.widgetLibraryTitle,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              leading: Icon(widget.iconData),
//              trailing: IconButton(icon: Icon(Icons.chevron_right), onPressed: () {
//                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                  return WidgetShowcasePage(widgetLibraryTitle: widget.widgetLibraryTitle, sublistKey: ,);
//                }));
//              }),
            )),
      ),
    );
  }
}
