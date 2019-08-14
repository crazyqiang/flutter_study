import 'package:flutter/material.dart';

import 'base/base_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: BaseDrawerWidget(
        title: 'APP',
        child: Center(
          child: Text('hello'),
        ),
      ),
    );
  }
}
