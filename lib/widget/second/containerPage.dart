import 'package:flutter/material.dart';
import 'package:flutter_study/base/base_widget.dart';
import 'package:flutter_study/base/bg_container_widget.dart';
import 'package:flutter_study/common/commonUtils.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return BaseWidget(
      title: 'Container&Decoration',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //BoxDecoration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('BoxDecoration:'),
                Container(
                  width: width * 0.4,
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xFF00FFFF),
                          style: BorderStyle.solid,
                          width: 2.0)),
                  alignment: AlignmentDirectional.center,
                  child: Text('I am Container'),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            //ShapeDecoration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('ShapeDecoration:'),
                Container(
                  width: width * 0.4,
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  //可以使用ShapeDecoration绘制边框 效果同上
                  decoration: ShapeDecoration(
                    shape: Border.all(
                        color: Color(0xFF00FFFF),
                        style: BorderStyle.solid,
                        width: 2.0),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text('I am Container'),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            //FlutterLogoDecoration
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Text('FlutterLogoDecoration:'),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: FlutterLogoDecoration(
                      lightColor: Colors.brown,
                      darkColor: Colors.green,
                      textColor: Colors.white),
                  child: Text(''),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),

            //UnderlineTabIndicator
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('UnderlineTabIndicator:'),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                      insets: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  child: Text(
                    'I am Container',
                    softWrap: true,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),

            //使用BoxDecoration封装一个常用背景
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'BoxDecoration封装常用背景',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //椭圆矩形
                BaseBgWidget(
                  child: Text('I am Container'),
                  borderRadius: 50.0,
                  borderWidth: 2.0,
                  borderColor: Colors.red,
                ),
                //边框矩形
                BaseBgWidget(
                  child: Text('I am Container'),
                  borderColor: Colors.green,
                ),
              ],
            ),
            BaseBgWidget(
              margin: EdgeInsets.only(top: 20.0),
              fillDefaultColor: Colors.blue,
              borderRadius: 5.0,
              child: Text(
                'I am Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '渐变：    ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                //渐变
                BaseBgWidget(
                  child: Text('I am Container'),
                  borderRadius: 5.0,
                  gradient: LinearGradient(colors: [
                    Color(0xffc8e6c8),
                    Color(0xff81c784),
                    Color(0xff66bb6a),
                    Color(0xff4caf50),
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '阴影： ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                //阴影
                BaseBgWidget(
                  child: Text('I am Container'),
                  margin: EdgeInsets.only(
                      top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                  borderColor: Colors.black,
                  borderWidth: 0.5,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0, //边缘会被模糊
//                        spreadRadius: 10.0, //边缘不模糊
                        offset: Offset(0.0, 0.0))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //不可点击
                BaseBgWidget(
                  child: Text(
                    '不可点击状态',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderRadius: 5.0,
                  margin: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                  fillDefaultColor: Colors.green,
                  fillActiveColor: Colors.blue,
                  fillDisableColor: Colors.grey,
                  btnEnable: false,
                  onPress: () {
                    CommonUtils.showToast(context, '我被点击了');
                  },
                ),
                //可点击事件
                BaseBgWidget(
                  child: Text(
                    '可点击状态',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderRadius: 5.0,
                  margin: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                  fillDefaultColor: Colors.green,
                  fillActiveColor: Colors.blue,
                  onPress: () {
                    CommonUtils.showToast(context, '我被点击了');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //圆形图片背景
                BaseBgWidget(
                  child: Center(
                    child: Text('戈哈呀', style: TextStyle(color: Colors.white)),
                  ),
                  onPress: () {
                    CommonUtils.showToast(context, '我被点击了');
                  },
                  margin: EdgeInsets.all(10.0),
                  width: 120.0,
                  height: 120.0,
                  shape: BoxShape.circle,
                  borderWidth: 2.0,
                  borderColor: Colors.red,
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/images/icon_photo.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                //圆形背景
                BaseBgWidget(
                  child: Center(
                    child: Text(
                      'Circle',
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                  shape: BoxShape.circle,
                  width: 120.0,
                  height: 120.0,
                  borderRadius: 5.0,
                  borderColor: Colors.green,
                  margin: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
