import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_new_service_event.dart';
part 'add_new_service_state.dart';

class AddNewServiceBloc extends Bloc<AddNewServiceEvent, AddNewServiceState> {
  AddNewServiceBloc() : super(AddNewServiceInitial()) {
    on<AddNewServiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
