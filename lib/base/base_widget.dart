import 'package:flutter/material.dart';

import '../drawerMenu.dart';

class BaseWidget extends StatelessWidget {
  Widget child;
  String title;

  BaseWidget({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: child,
      ),
    );
  }
}

class BaseNoTitleWidget extends StatelessWidget {
  Widget child;

  BaseNoTitleWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: child,
      ),
    );
  }
}

class BaseDrawerWidget extends StatelessWidget {
  Widget child;
  String title;
  List<Widget> rightBtns;

  BaseDrawerWidget(
      {Key key, @required this.child, @required this.title, this.rightBtns})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: rightBtns,
      ),
      drawer: DrawerMenuPage(),
      body: Center(
        child: child,
      ),
    );
  }
}

class BaseDrawerTabWidget extends StatelessWidget {
  Widget child;
  Widget title;
  int length;

  BaseDrawerTabWidget({Key key, this.length, this.title, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: length,
      child: Scaffold(
        appBar: AppBar(
          title: title,
        ),
        drawer: DrawerMenuPage(),
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
