import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/repo/%20service_repo.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void setup() async {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());

  // Supabase client
  GetIt.I.registerLazySingleton(() => Supabase.instance.client);

  // Repository
  GetIt.I.registerLazySingleton<ServiceRepository>(
    () => ServiceRepository(GetIt.I<SupabaseClient>()),
  );
  // // Bloc
  GetIt.I.registerFactory<AddServiceBloc>(() => AddServiceBloc(GetIt.I()));
}
