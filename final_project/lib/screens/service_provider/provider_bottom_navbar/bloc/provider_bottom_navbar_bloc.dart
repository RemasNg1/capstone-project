import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/core/helper/functions.dart';
import 'package:final_project/screens/general/chats/provider/provider_conversation_screen.dart';
import 'package:final_project/screens/service_provider/home/provider_home_screen.dart';
import 'package:final_project/screens/service_provider/provider_profile/provider_profile_screen.dart';
import 'package:final_project/screens/service_provider/service_booking2/booking2_screen.dart';
import 'package:final_project/screens/service_provider/services/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'provider_bottom_navbar_event.dart';
part 'provider_bottom_navbar_state.dart';

class ProviderBottomNavbarBloc
    extends Bloc<ProviderBottomNavbarEvent, ProviderBottomNavbarState> {
  int selectIndex = 0;

  List<Widget> screens = [
    ProviderHomeScreen(),
    ServicesBookingsScreen(),
    ServicesScreen(),
    // toDo change message with own user message
    ProviderConversationScreen(messages: getUnique()),
    ProviderProfileScreen(),
  ];
  ProviderBottomNavbarBloc() : super(ProviderBottomNavbarInitial()) {
    on<NavSelectionEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(
    NavSelectionEvent event,
    Emitter<ProviderBottomNavbarState> emit,
  ) {
    selectIndex = event.index;
    emit(SuccessState());
  }
}
