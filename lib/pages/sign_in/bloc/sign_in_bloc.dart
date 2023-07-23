import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc() : super(SignInState()){
    print("Sign in bloc created");
    /*on<EmailEvent> ((event, emit){
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent> ((event, emit){
      emit(state.copyWith(password: event.password));
    });*/

    on<EmailEvent>(_emailEventHandler);
    on<PasswordEvent>(_passwordEventHandler);

  }

  void _emailEventHandler(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEventHandler(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(password: event.password));
  }

}