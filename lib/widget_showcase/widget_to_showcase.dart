import 'package:flutter/material.dart';

import '../widget_library/themes.dart';
import 'bottom_sheet_bloc.dart';

class WidgetToShowcase extends StatefulWidget {
  final List<Widget> listOfWidgetInCurrentLibrary;

  WidgetToShowcase(this.listOfWidgetInCurrentLibrary);

  @override
  _WidgetToShowcaseState createState() => _WidgetToShowcaseState();
}

class _WidgetToShowcaseState extends State<WidgetToShowcase> {
  ThemeData _theme;
  bool isDarkTheme = false;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    _theme = StoryBoardThemes.lightTheme;
    currentIndex = 0;
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
    return MaterialApp(
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
            Expanded(
              child: StreamBuilder<int>(
                  stream: bloc.selectedWidgetIndexStream,
                  initialData: currentIndex,
                  builder: (context, futureData) {
                    if (futureData.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: widget
                                .listOfWidgetInCurrentLibrary[futureData.data],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Text('error'),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
