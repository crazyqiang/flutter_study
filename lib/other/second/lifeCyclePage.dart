import 'package:flutter/material.dart';
import 'package:flutter_study/base/base_widget.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  _LifeCyclePageState createState() {
    return _LifeCyclePageState();
  }
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      title: 'StatefulWidget&StatelessWidget',
      child: Center(
        child: Text('StatefulWidget&StatelessWidget'),
      ),
    );
  }
}
