import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:final_project/models/provider/provider_model.dart';
import 'package:final_project/repo/auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'provider_profile_event.dart';
part 'provider_profile_state.dart';

class ProviderProfileBloc
    extends Bloc<ProviderProfileEvent, ProviderProfileState> {
  final authGetit = GetIt.I.get<AuthLayer>();
  final Map<String, String> providerPrivacyKeys = {
    "privacy_policy.title_1": "privacy_policy.body_1",
    "privacy_policy.title_2": "privacy_policy.body_2",
    "privacy_policy.title_3": "privacy_policy.body_3",
    "privacy_policy.title_4": "privacy_policy.body_4",
    "privacy_policy.title_5": "privacy_policy.body_5",
    "privacy_policy.title_6": "privacy_policy.body_6",
    "privacy_policy.title_7": "privacy_policy.body_7",
    "privacy_policy.title_8": "privacy_policy.body_8",
  };
  final profileFormKey = GlobalKey<FormState>();
  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  TextEditingController crNumber = TextEditingController();
  final dataLayer = GetIt.I.get<DataLayer>();

  ProviderModel? currentProvider;
  ProviderProfileBloc() : super(ProviderProfileInitial()) {
    on<LogoutEvent>(logoutMethod);
    on<UpdateProfileInfoEvent>(updateMethod);
    on<LoadProviderProfileEvent>(loadProfileMethod);
  }

  FutureOr<void> loadProfileMethod(
    LoadProviderProfileEvent event,
    Emitter<ProviderProfileState> emit,
  ) async {
    try {
      currentProvider = await Auth.fetchCurrentProvider();

      if (currentProvider != null) {
        nameArController.text = currentProvider!.nameAr!;
        nameEnController.text = currentProvider!.nameEn!;
        phoneController.text = currentProvider!.phoneNumber!;
        crNumber.text = currentProvider!.commercialRegistrationNumber!;
        ibanController.text = currentProvider!.iban!;

        emit(ProviderProfileLoadedState(currentProvider!));
      } else {
        emit(LogoutFailureState("No user found."));
      }
    } catch (e) {
      emit(LogoutFailureState("Error loading profile: $e"));
    }
  }

  FutureOr<void> logoutMethod(
    LogoutEvent event,
    Emitter<ProviderProfileState> emit,
  ) async {
    try {
      await authGetit.logoutMethod();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutFailureState(e.toString()));
    }
  }

  FutureOr<void> updateMethod(
    UpdateProfileInfoEvent event,
    Emitter<ProviderProfileState> emit,
  ) async {
    try {
      await Auth.updateProviderInfo(
        nameAr: nameArController.text,
        nameEn: nameEnController.text,
        phoneNumber: phoneController.text,
        crNumber: crNumber.text,
        iban: ibanController.text,
      );

      emit(ClientProfileUpdatedState());
    } catch (e) {
      emit(ClientProfileUpdateFailedState("Error: $e"));
    }
  }
}
