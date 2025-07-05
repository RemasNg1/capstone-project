import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/repo/service.dart';

class DataLayer {
  List<ServicesProvidedModel> servicesProvidedModelData = [];
  List<ServiceModel> services = [];

  loadDataFromSupabase() async {
    servicesProvidedModelData = await Service.fetchAllServicesProvided();
    services = await Service.fetchServices();
  }
}
