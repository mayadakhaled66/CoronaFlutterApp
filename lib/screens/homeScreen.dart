import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/home_bloc.dart';
import 'package:flutterapp/bloc/home_states.dart';
import 'package:flutterapp/screens/CountScreen.dart';
import 'package:flutterapp/screens/aboutScreen.dart';
import 'package:flutterapp/screens/doaaScreen.dart';
import 'package:flutterapp/screens/rankScreen.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cIndex = 0;
  String _title;
  Widget _currentPage ;

  @override
  initState() {
    super.initState();
    _incrementTab(0);
  }

  void _incrementTab(index) {
    _cIndex = index;
    setState(() {
      switch (_cIndex) {
        case 0:
          _title = "Count Page";
          _currentPage = CountScreen();
          break;
        case 1:
          _title = "Rank Page";
          _currentPage = RankScreen();
          break;
        case 2:
          _title = "Doaa Page";
          _currentPage = DoaaScreen();
          break;
        case 3:
          _title = "About Page";
          _currentPage = AboutScreen();
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text(_title,style: Theme.of(context).textTheme.title,),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _currentPage,
        bottomNavigationBar: buildBottomBar(context));
  }
  Widget buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      currentIndex: _cIndex,
      onTap: _incrementTab,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account,
              color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text(
            'Count/تعداد',
            style: TextStyle(color: new Color(0xFF1abc9c)),
          ),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.date_range, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text(
              'Rank/بيانات',
              style: TextStyle(color: new Color(0xFF1abc9c)),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.spa, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text(
              'Doaa/دعاء',
              style: TextStyle(color: new Color(0xFF1abc9c)),
            )),
        BottomNavigationBarItem(
            icon:
            Icon(Icons.account_circle, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text(
              'About/عنا',
              style: TextStyle(color: new Color(0xFF1abc9c)),
            ))
      ],

      selectedItemColor: new Color(0xFF1abc9c),
      showUnselectedLabels: true,
//          unselectedItemColor: Colors.amber[800],
    );
  }
}
