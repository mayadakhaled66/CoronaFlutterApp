import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String,String> barTitle = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Center(
        child: Text("About page"),
      ),
    );
  }
}
