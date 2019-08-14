import 'package:flutter/material.dart';
import 'package:flutter_study/base/base_widget.dart';

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
    return BaseDrawerWidget(
      title: 'Container',
      child: Center(
        child: Text('container'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
