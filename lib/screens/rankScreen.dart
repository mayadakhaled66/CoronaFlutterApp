import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatefulWidget {
  @override
  _RankScreenState createState() {
    return _RankScreenState();
  }
}

class _RankScreenState extends State<RankScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String,String> barTitle = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Center(
        child: Text("Rank page"),
      ),
    );
  }
}
