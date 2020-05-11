import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/bloc/home_events.dart';
import 'package:flutterapp/bloc/home_states.dart';
import 'package:flutterapp/requestsControllers/getApiData.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  ApiData apiDataObject = ApiData();

//  HomeBloc({@required this.apiDataObject});
  @override
  HomeStates get initialState => HomeStateInitial();

  @override
  Stream<HomeStates> mapEventToState(HomeEvent event) async* {
    if (event is FetchData || event is RefreshData) {
      yield HomeStateLoading(isLoading: true);
      try {
        final Map<String, dynamic> response =
            await apiDataObject.getMyMainList();
        print("in home bloc fetch data is ===================> ${response}");
        if(response != null){

          yield HomeStateSuccess(successMessage: "Data is fetched successfully" , returnedResponse :response);
          print("###### current state is home success");
        }
        else{
          yield HomeStateFailer(errorMessage: "sorry no data !!");
          print("############## current state is home failer");
        }

      } on PlatformException catch (error) {
        yield HomeStateFailer(errorMessage: error.message);
        print("############### current state is home failer");
      }
    }
  }
}
