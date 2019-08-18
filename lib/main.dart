import 'package:flutter/material.dart';
import 'package:flutter_study/common/constant.dart';
import 'package:flutter_study/widget/second/containerPage.dart';
import 'package:flutter_study/widget/widgetPage.dart';
import 'base/base_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<String, Function> routes = {
    C.CONTAINER_PAGE: (context) => new WidgetPage(), //Widget一级页面
    C.CONTAINER_PAGE: (context) => new ContainerPage(), //Container页
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      onGenerateRoute: (setting) {
        final String name = setting.name;
        WidgetBuilder builder = this.routes[name];
        return MaterialPageRoute(
            builder: builder ?? new WidgetPage(), settings: setting);
      },
      home: WidgetPage(),
    );
  }
}
