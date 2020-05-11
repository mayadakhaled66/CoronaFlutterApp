import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchData extends HomeEvent {

//  List<dynamic> countries;
//  int confirmedValue;
//  int recoveredValue;
//  int deathsValue;
  FetchData();

  @override
  List<Object> get props => [];

}

class RefreshData extends HomeEvent {}
