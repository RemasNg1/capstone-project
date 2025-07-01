import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'provider_profile_event.dart';
part 'provider_profile_state.dart';

class ProviderProfileBloc
    extends Bloc<ProviderProfileEvent, ProviderProfileState> {
  final authGetit = GetIt.I.get<AuthLayer>();

  ProviderProfileBloc() : super(ProviderProfileInitial()) {
    on<LogoutEvent>(logoutMethod);
  }

  FutureOr<void> logoutMethod(
    LogoutEvent event,
    Emitter<ProviderProfileState> emit,
  ) async {
    try {
      await authGetit.logoutMethod();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutFailureState(e.toString()));
    }
  }
}
