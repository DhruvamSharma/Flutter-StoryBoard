import 'package:flutter/material.dart';
import 'package:storyboard/utils/colors.dart';
import 'package:storyboard/utils/list_item_widget.dart';
import 'package:storyboard/widget_library/common_utitlities/common_colors.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';

class WidgetShowcasePage extends StatefulWidget {
  final String sublistKey;
  final String widgetLibraryTitle;

  WidgetShowcasePage({
    this.sublistKey,
    @required this.widgetLibraryTitle,
  });

  @override
  _WidgetShowcasePageState createState() => _WidgetShowcasePageState();
}

class _WidgetShowcasePageState extends State<WidgetShowcasePage> {
  int currentIndex;
  List<Widget> listOfWidgetInCurrentLibrary = List();
  List<String> listOfNamesOfWidgetInCurrentLibrary = List();

  bool isExpanded = false;
  double normalWidgetListHeight = 90;
  double expandedWidgetListHeight = 300;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

//     Calculating names of widget in the library
    WidgetStateMapData.getWidgetTitle(widget.widgetLibraryTitle, widget.sublistKey)
        .forEach((it) {
      listOfNamesOfWidgetInCurrentLibrary.add(it);
    });

    // Calculating the widgets in the library
    WidgetStateMapData.getWidgets(widget.widgetLibraryTitle, widget.sublistKey).forEach((it) {
      listOfWidgetInCurrentLibrary.add(it);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          listOfNamesOfWidgetInCurrentLibrary.isEmpty
              ? "No widgets found"
              : listOfNamesOfWidgetInCurrentLibrary[currentIndex],
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: primaryColor,
        onClosing: () {},
        enableDrag: true,
        elevation: 8,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          'Widget Gallery',
                          style: Theme.of(context).textTheme.headline,
                        ),
                        trailing: IconButton(
                            icon: Icon(isExpanded
                                ? Icons.arrow_downward
                                : Icons.arrow_upward),
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            }),
                      ),
                    ),
                    AnimatedContainer(
                      padding: EdgeInsets.only(bottom: 0),
                      duration: Duration(milliseconds: 50),
                      height: isExpanded
                          ? (30.0 *
                                  listOfNamesOfWidgetInCurrentLibrary.length) +
                              40
                          : 0,
                      constraints: BoxConstraints(
                        maxHeight: 400,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          ...listOfNamesOfWidgetInCurrentLibrary.map((it) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = listOfNamesOfWidgetInCurrentLibrary.indexOf(it);
                                  });
                                },
                                child: ListItemWidget(
                                    it),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: CommonColors.lightColor,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: listOfWidgetInCurrentLibrary.isEmpty
                    ? Container()
                    : listOfWidgetInCurrentLibrary[currentIndex],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
