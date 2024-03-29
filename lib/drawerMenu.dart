import 'package:flutter/material.dart';

import 'base/base_widget.dart';
import 'common/bean/drawer_bean.dart';
import 'common/bean/fragment_bean.dart';
import 'common/constant.dart';
import 'common/eventBus/EventBus.dart';

//drawer中的菜单
class DrawerMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DrawerMenuState();
  }
}

class DrawerMenuState extends State<DrawerMenuPage> {
  List<DrawerBean> buildList() {
    List<DrawerBean> list = [];
    list.add(new DrawerBean('', null, '', 0));
    list.add(new DrawerBean(C.CONTAINER_PAGE, Icons.grid_on, C.MENU_WIDGET, 1));
    list.add(new DrawerBean(C.OTHER_PAGE, Icons.layers, C.MENU_OTHER, 1));
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
              title: Container(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(bean.menuName),
              ),
              leading: Icon(bean.iconData),
              onTap: () {
                Navigator.pop(context);
                //刷新drawer
                if (index < 1) return;
                bus.emit(Bus.REFRESH_DRAWER, index - 1);
              },
            );
          }
        });
  }

  Widget _buildHead(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
      color: Color(Col.bg_bar_color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: new ClipOval(
                child: new Image.asset(
                  'assets/images/icon_photo.jpeg',
                  width: 60.0,
                  height: 60.0,
                ),
              ),
            ),
            onTap: () {
//            Navigator.pushNamed(context, C.WORK_PAGE);
            },
          ),
          //中间
          Container(
            padding: EdgeInsets.only(left: 10.0),
            margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Author: 小马快跑',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Email: mqcoder90@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Blog: http://blog.csdn.net/u013700502',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

abstract class ListItem {}

class HeadItem implements ListItem {}

class ContentItem implements ListItem {}
