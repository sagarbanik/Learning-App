import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/welcome/bloc/welcom_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class WelcomeBlock extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBlock() : super(WelcomeState()){
    print('Welcome Block Created');
    //Event
    on<WelcomeEvent>((event,emit){
      emit(WelcomeState(page: state.page));
    });
  }
}