import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoaaScreen extends StatefulWidget {
  @override
  _DoaaScreenState createState() {
    return _DoaaScreenState();
  }
}

class _DoaaScreenState extends State<DoaaScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String,String> barTitle = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Center(
        child: Text("Doaa page"),
      ),
    );
  }
}
