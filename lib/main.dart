import 'package:flutter/material.dart';
import 'package:green_plus/screens/loading.dart';

void main() => runApp(MyApp());

Map<int, Color> color = {
  50: Color.fromRGBO(132, 174, 83, .1),
  100: Color.fromRGBO(132, 174, 83, .2),
  200: Color.fromRGBO(132, 174, 83, .3),
  300: Color.fromRGBO(132, 174, 83, .4),
  400: Color.fromRGBO(132, 174, 83, .5),
  500: Color.fromRGBO(132, 174, 83, .6),
  600: Color.fromRGBO(132, 174, 83, .7),
  700: Color.fromRGBO(132, 174, 83, .8),
  800: Color.fromRGBO(132, 174, 83, .9),
  900: Color.fromRGBO(132, 174, 83, 1),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green +',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
