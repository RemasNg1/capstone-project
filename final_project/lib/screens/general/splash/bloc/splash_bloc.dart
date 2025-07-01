import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/repo/supabase.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final session = SupabaseConnect.supabase!.client.auth.currentSession;
  final authGetit = GetIt.I.get<AuthLayer>();

  SplashBloc() : super(SplashInitial()) {
    on<SkipIntroEvent>(createMethod);
  }

  FutureOr<void> createMethod(
    SkipIntroEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 6));
    final user = SupabaseConnect.supabase!.client.auth.currentUser;
    if (user != null) {
      final isClient = await authGetit.isClient();
      final isProvider = await authGetit.isProvider();
      print('isClient $isClient');
      print('isProvider $isProvider');
      if (isClient) {
        emit(UserLoggedInAsClientState());
      } else if (isProvider) {
        emit(UserLoggedInAsProviderState());
      } else {
        emit(UserLoggedInAsAnonymousState());
      }
    } else {
      emit(UserNotLoggedInState());
    }
  }
}
