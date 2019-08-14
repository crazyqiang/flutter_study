import 'package:flutter/material.dart';

import 'common/bean/drawer_bean.dart';
import 'common/constant.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DrawerState();
  }
}

class DrawerState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: _buildMenus(),
          ),
        ],
      ),
    );
  }
}

List<DrawerBean> buildList() {
  List<DrawerBean> list = [];
  list.add(new DrawerBean('', '', '', 0));
  list.add(new DrawerBean(
      C.WORK_PAGE, 'assets/images/ic_work_bench.png', '控件系列', 1));
  return list;
}

Widget _buildMenus() {
  final List<DrawerBean> list = buildList();
  final items = new List<ListItem>.generate(list.length,
      (i) => list[i].type == 0 ? new HeadItem() : new ContentItem());
  return new ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        if (item is HeadItem) {
          //头部Item
          return _buildHead(context);
        } else {
          //内容Item
          DrawerBean bean = list[index];
          return ListTile(
            title: Text(bean.menuName),
            leading: new Image.asset(
              bean.imgName,
              width: 25.0,
              height: 25.0,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          );
        }
      });
}

Widget _buildHead(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
    color: Color(Col.bg_bar_color),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new GestureDetector(
          child: new ClipOval(
            child: new Image.asset(
              'assets/images/icon_photo.jpeg',
              width: 60.0,
              height: 60.0,
            ),
          ),
          onTap: () {
//            Navigator.pushNamed(context, C.WORK_PAGE);
          },
        ),
        //中间
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Blog:http://blog.csdn.net/u013700502',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Email:mqcoder90@gmail.com',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Author: 小马快跑',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

abstract class ListItem {}

class HeadItem implements ListItem {}

class ContentItem implements ListItem {}
