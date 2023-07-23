import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_events.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_states.dart';

class SettingsBloc extends Bloc<SettingsEvents,SettingsStates>{
  SettingsBloc() : super(const SettingsStates()){
    on<TriggerSettings> (_triggerSettings);
  }

  void _triggerSettings(SettingsEvents events,Emitter<SettingsStates> emit){
    emit(const SettingsStates());
  }

}