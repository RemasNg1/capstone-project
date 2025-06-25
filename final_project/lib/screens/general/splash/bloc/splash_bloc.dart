import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SkipIntroEvent>(createMethod);
  }

  FutureOr<void> createMethod(
    SkipIntroEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 6));
    emit(SuccessLoadingState());
  }
}
