class DrawerBean {
  int type; //ListView多type使用
  String menuName; //menu名称
  String imgName; //menu图片
  String router; //跳转路由

  DrawerBean(this.router, this.imgName, this.menuName, this.type);
}
