import 'package:flutter/widgets.dart';

class FragmentBean {
  String title;
  Widget widget;
  List<Widget> rightBtns;

  FragmentBean(this.title, this.widget, {this.rightBtns});
}
