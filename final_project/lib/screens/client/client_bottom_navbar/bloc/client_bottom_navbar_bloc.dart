import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:final_project/screens/client/bookings/bookings_screen.dart';
import 'package:final_project/screens/client/home/home_screen.dart';
import 'package:final_project/screens/client/profile/client_profile_screen.dart';
import 'package:final_project/screens/general/chats/client/conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'client_bottom_navbar_event.dart';
part 'client_bottom_navbar_state.dart';

class ClientBottomNavbarBloc
    extends Bloc<ClientBottomNavbarEvent, ClientBottomNavbarState> {
  int selectIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    BookingsScreen(),
    ConversationScreen(messages: []),
    ClientProfileScreen(),
  ];

  ClientBottomNavbarBloc() : super(ClientBottomNavbarInitial()) {
    on<NavSelectionEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(
    NavSelectionEvent event,
    Emitter<ClientBottomNavbarState> emit,
  ) {
    selectIndex = event.index;
    emit(SuccessState());
  }
}
