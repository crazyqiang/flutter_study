import 'package:flutter/material.dart';

class BaseBgWidget extends StatefulWidget {
  double width;
  double height;
  Widget child; //子widget
  EdgeInsetsGeometry margin; //Container margin
  EdgeInsetsGeometry padding; //Container padding
  Color fillDefaultColor; //默认填充颜色
  Color fillActiveColor; //点击时颜色
  Color fillDisableColor; //不可点击时颜色
  Color borderColor; //边框颜色
  double borderWidth; //边框宽度
  double borderRadius; //边框角度
  List<BoxShadow> boxShadow; //Container阴影
  BoxShape shape; //background形状
  Gradient gradient; //Container颜色渐变
  final VoidCallback onPress;

  bool btnEnable; //按钮当前是否enable
  DecorationImage image; //背景图片

  BaseBgWidget(
      {Key key,
      this.width,
      this.height,
      @required this.child,
      this.margin,
      this.padding,
      this.fillDefaultColor = Colors.white,
      this.fillActiveColor = Colors.blue,
      this.fillDisableColor = Colors.grey,
      this.borderColor = Colors.white,
      this.borderWidth,
      this.borderRadius,
      this.boxShadow,
      this.shape,
      this.gradient,
      this.onPress,
      this.btnEnable = true,
      this.image})
      : super(key: key);

  @override
  _BaseBgWidgetState createState() {
    return _BaseBgWidgetState();
  }
}

class _BaseBgWidgetState extends State<BaseBgWidget> {
  Color curColor;

  @override
  void initState() {
    super.initState();
    if (widget.onPress != null && !widget.btnEnable) {
      curColor = widget.fillDisableColor;
    } else {
      curColor = widget.fillDefaultColor;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    curColor = widget.fillDefaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.btnEnable && widget.onPress != null) {
          widget.onPress();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (widget.btnEnable && widget.onPress != null) {
          curColor = widget.fillActiveColor;
          setState(() {});
        }
      },
      onTapUp: (TapUpDetails details) {
        if (widget.btnEnable && widget.onPress != null) {
          curColor = widget.fillDefaultColor;
          setState(() {});
        }
      },
      onTapCancel: () {
        if (widget.btnEnable && widget.onPress != null) {
          curColor = widget.fillDefaultColor;
          setState(() {});
        }
      },
      child: Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin == null ? EdgeInsets.all(0.0) : widget.margin,
          padding: widget.padding == null
              ? EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0)
              : widget.padding,
//        alignment: Alignment.center,
          decoration: BoxDecoration(
              //填充颜色
              color: curColor,
              //边框颜色及宽度
              border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth == null ? 1.0 : widget.borderWidth),
              //边框椭圆半径
              borderRadius: widget.shape != BoxShape.circle
                  ? BorderRadius.all(Radius.circular(
                      widget.borderRadius == null ? 0.0 : widget.borderRadius))
                  : null,
              //设置阴影
              boxShadow: widget.boxShadow,
              //渐变
              gradient: widget.gradient == null ? null : widget.gradient,
              image: widget.image,

              //背景形状
              shape: widget.shape == null ? BoxShape.rectangle : widget.shape),
          child: widget.child),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
