import 'package:flutter/widgets.dart';

class DrawerBean {
  int type; //ListView多type使用
  String menuName; //menu名称
  String imgName; //menu图片
  String router; //跳转路由
  IconData iconData;

  DrawerBean(this.router, this.iconData, this.menuName, this.type);
}
