import 'package:flutter/material.dart';
import 'package:flutter_study/common/constant.dart';
import 'package:flutter_study/widget/second/containerPage.dart';
import 'package:flutter_study/widget/widgetPage.dart';
import 'base/base_widget.dart';
import 'common/bean/fragment_bean.dart';
import 'common/eventBus/EventBus.dart';
import 'other/otherPage.dart';
import 'other/second/lifeCyclePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<String, Function> routes = {
//    C.CONTAINER_PAGE: (context) => new WidgetPage(), //Widget一级页面
    C.CONTAINER_PAGE: (context) => new ContainerPage(), //Container页
    C.OTHER_PAGE: (context) => new OtherPage(), //其他功能页
    C.LIFE_CYCLER_PAGE: (context) => new LifeCyclePage(), //生命周期页
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
            builder: builder ?? new DrawerPage(), settings: setting);
      },
      home: DrawerPage(),
    );
  }
}

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() {
    return _DrawerPageState();
  }
}

class _DrawerPageState extends State<DrawerPage> {
  List<FragmentBean> list = [];
  int curPos = 0; //当前页面

  @override
  void initState() {
    super.initState();
    buildFragments();
    listenCallBack();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerWidget(
      title: list[curPos].title,
      child: list[curPos].widget,
    );
  }

  void listenCallBack() {
    //刷新Drawer
    bus.on(Bus.REFRESH_DRAWER, (arg) {
      curPos = arg;
      setState(() {});
    });
  }

  void buildFragments() {
    list.add(FragmentBean(C.MENU_WIDGET, WidgetPage()));
    list.add(FragmentBean(C.MENU_OTHER, OtherPage()));
  }
}
