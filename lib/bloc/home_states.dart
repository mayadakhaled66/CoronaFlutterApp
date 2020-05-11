import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class HomeStates extends Equatable {
  Map<String,dynamic> response;
// making private constructor  HomeStates._();
  HomeStates();

//  factory HomeStates.initial() {
//    //cascade property in dart
//    return HomeStates._()
//      ..countries = ''
//      ..confirmedValue = 0
//      ..deathsValue = 0
//      ..recoveredValue = 0
//      ..isLoading = false;
//  }
  @override
  List<Object> get props => [];
//  List<Object> get props => [deathsValue, confirmedValue, countries, recoveredValue];
}

class HomeStateInitial extends HomeStates {
//  bool isLoading ;
  HomeStateInitial();

  @override
  String toString() => 'home initial state';
//  @override
//  List<Object> get props =>[isLoading];
}

class HomeStateLoading extends HomeStates {
  bool isLoading;

  HomeStateLoading({@required this.isLoading});

  @override
  String toString() => 'home state loading : ${isLoading}';

  @override
  List<Object> get props => [isLoading];
}

class HomeStateFailer extends HomeStates {
  String errorMessage;

  HomeStateFailer({@required this.errorMessage});

  @override
  String toString() {
    return "**** home state is failer : ${errorMessage}";
  }

  @override
  List<Object> get props => [errorMessage];
}

class HomeStateSuccess extends HomeStates {
  String successMessage;
  Map<String , dynamic> returnedResponse;
  HomeStateSuccess({@required this.successMessage , this.returnedResponse});
  @override
  String toString() {
    return "**** home state is success : ${successMessage}";
  }

  @override
  List<Object> get props => [successMessage];
}
