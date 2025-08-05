import 'package:final_project/screens/service_provider/add_new_service/addNew_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_bloc.dart';
import 'package:final_project/screens/service_provider/add_new_service/bloc/add_new_service_event.dart';

class EditServiceScreen extends StatelessWidget {
  final int serviceId;

  const EditServiceScreen({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I<AddServiceBloc>();

    return BlocProvider(
      create: (_) => bloc
        ..add(LoadServiceTypes())
        ..add(LoadRegionsAndCities())
        ..add(LoadServiceForEditing(serviceId)),
      child: const _EditServiceView(),
    );
  }
}

class _EditServiceView extends StatelessWidget {
  const _EditServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNewServiceScreen(isEditing: true);
  }
}
