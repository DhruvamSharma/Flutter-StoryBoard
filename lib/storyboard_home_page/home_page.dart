import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:storyboard/article_page/article_page.dart';
import 'package:storyboard/storyboard_home_page/widget_list_container.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WidgetListContainer> widgetHeadingList = List();

  bool isBigScreen = false;

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
    isBigScreen = MediaQuery.of(context).size.width >= 400 &&
        MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),

      body: SafeArea(
        child: isBigScreen && kIsWeb
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 45),
              width: isBigScreen ? 600 : MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widgetHeadingList.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, i) {
                  return widgetHeadingList[i];
                },
              ),
            ),

            Expanded(child: ArticlesPage()),

          ],
        )
            : ListView.builder(
              shrinkWrap: true,
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
