import 'package:flutter/material.dart';
import 'package:flutter_study/base/base_widget.dart';
import 'package:flutter_study/base/bg_container_widget.dart';
import 'package:flutter_study/common/commonUtils.dart';
import 'package:flutter_study/common/constant.dart';

class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() {
    return _WidgetPageState();
  }
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerWidget(
      title: 'widget',
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(
            child: BaseBgWidget(
              child: Text(
                'Container&Decoration',
                style: TextStyle(color: Colors.white),
              ),
              borderRadius: 5.0,
              margin: EdgeInsets.only(
                  top: 50.0, left: 10.0, right: 10.0, bottom: 10.0),
              fillDefaultColor: Color(0xff8d6e63),
              fillActiveColor: Colors.brown,
              onPress: () {
                Navigator.of(context).pushNamed(C.CONTAINER_PAGE);
              },
            ),
          )
        ],
      ),
    );
  }
}
