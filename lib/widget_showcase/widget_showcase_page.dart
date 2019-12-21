import 'package:flutter/material.dart';
import 'package:storyboard/widget_library/common_utitlities/common_colors.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';
import 'package:storyboard/widget_showcase/bottom_sheet_bloc.dart';
import 'package:storyboard/widget_showcase/storyboard_bottom_sheet.dart';
import 'package:storyboard/widget_showcase/widget_to_showcase.dart';

class WidgetShowcasePage extends StatefulWidget {
  final String sublistKey;
  final String widgetLibraryTitle;

  WidgetShowcasePage({
    @required this.sublistKey,
    @required this.widgetLibraryTitle,
  });

  @override
  _WidgetShowcasePageState createState() => _WidgetShowcasePageState();
}

class _WidgetShowcasePageState extends State<WidgetShowcasePage> {
  int currentIndex;
  List<Widget> listOfWidgetInCurrentLibrary = List();
  List<String> listOfNamesOfWidgetInCurrentLibrary = List();

  double normalWidgetListHeight = 90;
  double expandedWidgetListHeight = 300;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
//     Calculating names of widget in the library
    WidgetStateMapData.getWidgetTitle(
            widget.widgetLibraryTitle, widget.sublistKey)
        .forEach((it) {
      listOfNamesOfWidgetInCurrentLibrary.add(it);
    });

    // Calculating the widgets in the library
    WidgetStateMapData.getWidgets(widget.widgetLibraryTitle, widget.sublistKey)
        .forEach((it) {
      listOfWidgetInCurrentLibrary.add(it);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: StreamBuilder<int>(
          initialData: currentIndex,
          stream: bloc.selectedWidgetIndexStream,
          builder: (context, newIndex) {
            return Text(
              listOfNamesOfWidgetInCurrentLibrary.isEmpty
                  ? "No widgets found"
                  : listOfNamesOfWidgetInCurrentLibrary[newIndex.data],
              style: Theme.of(context).textTheme.title,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      bottomSheet: StoryBoardBottomSheet(
        listOfNamesOfWidgetInCurrentLibrary:
            listOfNamesOfWidgetInCurrentLibrary,
        listOfWidgetInCurrentLibrary: listOfWidgetInCurrentLibrary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              color: CommonColors.lightColor,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: listOfWidgetInCurrentLibrary.isEmpty
                    ? Container()
                    : WidgetToShowcase(listOfWidgetInCurrentLibrary),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
