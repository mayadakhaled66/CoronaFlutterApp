import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/Providers/dataLoader.dart';
import 'package:flutterapp/bloc/home_bloc.dart';
import 'package:flutterapp/bloc/home_events.dart';
import 'package:flutterapp/bloc/home_states.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatefulWidget {
  @override
  _CountScreenState createState() {
    return _CountScreenState();
  }
}
class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
//    Provider.of<DataLoader>(context).getMyCountriesList();
//    final dataList = Provider.of<DataLoader>(context).coronaDataList;
//    print("dataaaa : $dataList");
//    final Map<String,String> barTitle = ModalRoute.of(context).settings.arguments;

    return BlocBuilder<HomeBloc, HomeStates>(
        bloc: HomeBloc(),
        builder: (context, state) {
          BlocProvider.of<HomeBloc>(context).add(FetchData());
          if (state is HomeStateInitial) {
            return Center(
              child: Container(
                child: Text("initial state"),
              ),
            );
          }
          if (state is HomeStateLoading) {
             return Center(
               child: Container(
                 child: Text("loading data"),
               ),
             );
          }
          if (state is HomeStateSuccess) {
              return SingleChildScrollView(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Confirmed : " , style: TextStyle(color: ThemeData.dark().primaryColor),),
                        Text(state.response['confirmed']),
                      ],
                    ),
                  ],
                ),
              );
          }
          if (state is HomeStateFailer) {

              return Container(
                child: Text("Failer of fetch data"),
              );

          }
          return Center(child: Container(
            child: Text("no state is match"),
          ),);
        }

    );
  }

  Widget buildDataList(HomeStates state) {
    print("****************** inside the page UI data info is : ");
    print(state.response);
    FutureBuilder(
        builder: (ctx, snapshot) {
          print("//#################### ${state.response['confirmed']}");
          if (snapshot.connectionState == ConnectionState.done) {
            return ListTile(
                title: Text("Confirmed : "),
                trailing: Text("${state.response['confirmed']}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle,
                )
            );
          }
          else {
            return ListTile(
                trailing: Text("...", style: Theme
                    .of(context)
                    .textTheme
                    .subtitle,));
          }
        }
    );
    if (state is HomeStateInitial) {
//      setState(() {
//        print("//#################### ${state.response['confirmed']}");
      return SingleChildScrollView(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Confirmed : "),
//                  Text(state.response['confirmed']),
              ],
            ),
          ],
        ),
      );
//      });
    }
    if (state is HomeStateFailer) {
      setState(() {
        print("//#################### failer");
        return Container(
          child: Text("Failer of fetch data"),
        );
      });
    }
    if (state is HomeStateLoading) {
      setState(() {
        print("//#################### Loading");
        return Container(
          child: Text("loading data"),
        );
      });
    }
  }
}
