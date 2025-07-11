import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/auth_layer.dart';
import 'package:final_project/data_layer/data_layer.dart';
import 'package:final_project/models/client/client_model.dart';
import 'package:final_project/repo/auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'client_profile_event.dart';
part 'client_profile_state.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  final authGetit = GetIt.I.get<AuthLayer>();

  final dataLayer = GetIt.I.get<DataLayer>();
  final profileFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  ClientModel? currentUser;
  final Map<String, String> clientPrivacyKeys = {
    "privacy_policy.title_1": "privacy_policy.body_1",
    "privacy_policy.title_2": "privacy_policy.body_2",
    "privacy_policy.title_3": "privacy_policy.body_3",
    "privacy_policy.title_4": "privacy_policy.body_4",
    "privacy_policy.title_5": "privacy_policy.body_5",
    "privacy_policy.title_6": "privacy_policy.body_6",
    "privacy_policy.title_7": "privacy_policy.body_7",
    "privacy_policy.title_8": "privacy_policy.body_8",
  };
  ClientProfileBloc() : super(ClientProfileInitial()) {
    on<LoadClientProfileEvent>(loadProfileMethod);
    on<UpdateProfileInfoEvent>(updateMethod);
    on<LogoutEvent>(logoutMethod);
    // on<UpdateAvatarEvent>((event, emit) async {
    // emit(ClientProfileUpdatingState());
    //     try {
    //       final updatedUser = await Auth.updateUserAvatar(event.newAvatarFile);
    //       currentUser = updatedUser;

    //       emit(ClientProfileLoadedState(updatedUser));
    //     } catch (e) {
    //       emit(ClientProfileUpdateFailedState(e.toString()));
    //     }
    // });
  }

  FutureOr<void> logoutMethod(
    LogoutEvent event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      await authGetit.logoutMethod();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutFailureState(e.toString()));
    }
  }

  FutureOr<void> loadProfileMethod(
    LoadClientProfileEvent event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      currentUser = await Auth.fetchCurrentUser();

      if (currentUser != null) {
        nameController.text = currentUser!.name;
        phoneController.text = currentUser!.phoneNumber;
        emailController.text = currentUser!.email!;

        emit(ClientProfileLoadedState(currentUser!));
      } else {
        emit(LogoutFailureState("No user found."));
      }
    } catch (e) {
      emit(LogoutFailureState("Error loading profile: $e"));
    }
  }

  FutureOr<void> updateMethod(
    UpdateProfileInfoEvent event,
    Emitter<ClientProfileState> emit,
  ) async {
    try {
      await Auth.updateClientInfo(
        name: nameController.text,
        phoneNumber: phoneController.text,
      );

      currentUser = currentUser?.copyWith(
        name: nameController.text,
        phoneNumber: phoneController.text,
      );

      emit(ClientProfileUpdatedState());
    } catch (e) {
      emit(ClientProfileUpdateFailedState("Error: $e"));
    }
  }
}
