import 'package:flutter/material.dart';
import 'package:flutter_study/base/base_widget.dart';
import 'package:flutter_study/base/bg_container_widget.dart';
import 'package:flutter_study/common/constant.dart';

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() {
    return _OtherPageState();
  }
}

class _OtherPageState extends State<OtherPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseNoTitleWidget(
//      title: 'other',
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(
            child: BaseBgWidget(
              child: Text(
                'LifeCycle',
                style: TextStyle(color: Colors.white),
              ),
              borderRadius: 5.0,
              margin: EdgeInsets.only(
                  top: 50.0, left: 10.0, right: 10.0, bottom: 10.0),
              fillDefaultColor: Color(0xff8d6e63),
              fillActiveColor: Colors.brown,
              onPress: () {
                Navigator.of(context).pushNamed(C.LIFE_CYCLER_PAGE);
              },
            ),
          )
        ],
      ),
    );
  }
}
