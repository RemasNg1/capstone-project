import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'client_profile_event.dart';
part 'client_profile_state.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  final authGetit = GetIt.I.get<AuthLayer>();

  ClientProfileBloc() : super(ClientProfileInitial()) {
    on<ClientProfileEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LogoutEvent>(logoutMethod);
  }

  FutureOr<void> logoutMethod(
    LogoutEvent event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      await authGetit.logoutMethod();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutFailureState(e.toString()));
    }
  }
}
