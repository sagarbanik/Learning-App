import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/application/bloc/app_state.dart';

import 'app_event.dart';

class AppBloc extends Bloc<AppEvent,AppState>{
  AppBloc() : super(const AppState()){
    on<TriggerAppEvent> ((event,emit){
      emit(AppState(index: event.index));
    });
  }
}