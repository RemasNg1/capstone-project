import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_type_event.dart';
part 'user_type_state.dart';

class UserTypeBloc extends Bloc<UserTypeEvent, UserTypeState> {
  UserTypeBloc() : super(UserTypeInitial()) {
    on<UserTypeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
