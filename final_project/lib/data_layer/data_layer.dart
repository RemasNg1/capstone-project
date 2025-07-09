import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/models/provider/provider_model.dart';
import 'package:final_project/models/services_models/favorite_service/favorite_service_model.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/models/services_models/service/service_model.dart';
import 'package:final_project/repo/auth.dart';
import 'package:final_project/repo/service.dart';

class DataLayer {
  List<ServicesProvidedModel> servicesProvidedModelData = [];
  List<ServiceModel> services = [];
  List<FavoriteService> favorites = [];
  late ClientModel? currentUser;
  late ProviderModel? currentProvider;
  List<ServicesProvidedModel> favoriteServices = [];

  loadDataFromSupabase() async {
    servicesProvidedModelData = await Service.fetchAllServicesProvided();
    services = await Service.fetchServices();
    favorites = await Service.fetchFavoriteServices();
    currentUser = await Auth.fetchCurrentUser();
    currentProvider = await Auth.fetchCurrentProvider();
  }

  loadOnlyFavoriteServices() async {
    if (currentUser == null) return;

    favorites = await Service.fetchFavoriteServices();
    final favoriteServiceIds = favorites
        .map((f) => f.serviceProvidedId)
        .toSet();

    List<ServicesProvidedModel> allServices =
        await Service.fetchAllServicesProvided();

    favoriteServices = allServices
        .where((s) => favoriteServiceIds.contains(s.id))
        .map((s) => s.copyWith(isFavorite: true))
        .toList();
  }
}
