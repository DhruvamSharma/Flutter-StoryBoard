import 'package:flutter/material.dart';
import 'package:storyboard/utils/colors.dart';
import 'package:storyboard/home_page/widget_list_container.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WidgetListContainer> widgetHeadingList = List();

  @override
  void initState() {
    super.initState();

    WidgetListData.widgetListMap.keys.forEach((it) {
      widgetHeadingList.add(
        WidgetListContainer(
          Icons.call_to_action,
          widgetLibraryTitle: it,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: accentColor,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),

      body: SafeArea(
        child: ListView.builder(
          itemCount: widgetHeadingList.length,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, i) {
            return widgetHeadingList[i];
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
