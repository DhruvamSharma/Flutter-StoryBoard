import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storyboard/utils/colors.dart';

import 'storyboard_home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: primaryDarkColor,
        accentColor: accentColor,
        primaryColorDark: primaryDarkColor,
        primaryColor: primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: GoogleFonts.robotoCondensed(),
          subtitle: GoogleFonts.robotoCondensed(),
          body1: GoogleFonts.robotoCondensed(),
          body2: GoogleFonts.robotoCondensed(),
          button: GoogleFonts.robotoCondensed(),
          caption: GoogleFonts.robotoCondensed(),
          display1: GoogleFonts.robotoCondensed(),
          display2: GoogleFonts.robotoCondensed(),
          display3: GoogleFonts.robotoCondensed(),
          display4: GoogleFonts.robotoCondensed(),
          headline: GoogleFonts.robotoCondensed(),
          overline: GoogleFonts.robotoCondensed(),
          subhead: GoogleFonts.robotoCondensed(),
        ),
      ),
      home: MyHomePage(title: 'Our Story'),
    );
  }
}
