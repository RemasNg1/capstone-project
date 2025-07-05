import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:get_it/get_it.dart';

void setup() async {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
  GetIt.I.registerSingleton<DataLayer>(DataLayer());
}
