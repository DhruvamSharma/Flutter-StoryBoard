import 'package:flutter/material.dart';
import 'package:storyboard/themes.dart';
import 'package:storyboard/widget_library/common_utitlities/common_colors.dart';
import 'package:storyboard/widget_library/widget_list_data.dart';
import 'package:storyboard/widget_showcase/bottom_sheet_bloc.dart';
import 'package:storyboard/widget_showcase/storyboard_bottom_sheet.dart';

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

  ThemeData _theme;
  bool isDarkTheme = false;

  double normalWidgetListHeight = 90;
  double expandedWidgetListHeight = 300;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

    _theme = StoryBoardThemes.lightTheme;

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

  void _changeTheme(StoryboardThemeKeys themeKey) {
    setState(() {
      if (themeKey == StoryboardThemeKeys.DARK) {
        _theme = StoryBoardThemes.lightTheme;
      } else {
        _theme = StoryBoardThemes.darkTheme;
      }
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
              _changeTheme(StoryboardThemeKeys.LIGHT);
            },
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
                    : MaterialApp(
                        theme: _theme,
                        debugShowCheckedModeBanner: false,
                        home: Scaffold(
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Switch(
                                  activeTrackColor: Colors.white,
                                  activeColor: Colors.white,
                                  value: isDarkTheme,
                                  onChanged: (newValue) {
                                    if (isDarkTheme) {
                                      _changeTheme(StoryboardThemeKeys.DARK);
                                    } else {
                                      _changeTheme(StoryboardThemeKeys.LIGHT);
                                    }
                                    setState(() {
                                      isDarkTheme = !isDarkTheme;
                                    });
                                  },
                                ),
                              ),
                              StreamBuilder<int>(
                                stream: bloc.selectedWidgetIndexStream,
                                initialData: 0,
                                builder: (context, futureData) {
                                  currentIndex = futureData.data;
                                  return Center(
                                    child: AnimatedSwitcher(
                                      duration: Duration(milliseconds: 300),
                                      child: listOfWidgetInCurrentLibrary[
                                          currentIndex],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
