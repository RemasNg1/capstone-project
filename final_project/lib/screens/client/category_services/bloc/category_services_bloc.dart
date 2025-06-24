import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_services_event.dart';
part 'category_services_state.dart';

class CategoryServicesBloc extends Bloc<CategoryServicesEvent, CategoryServicesState> {
  CategoryServicesBloc() : super(CategoryServicesInitial()) {
    on<CategoryServicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
