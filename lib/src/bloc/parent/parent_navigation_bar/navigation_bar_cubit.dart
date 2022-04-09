import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/src/bloc/parent/parent_navigation_bar/navigation_bar_states.dart';
import 'package:selaheltelmeez/src/views/parent/dashboard/parent_dashboard_screen.dart';
import 'package:selaheltelmeez/src/views/parent/invitations/parent_invitations_screen.dart';
import 'package:selaheltelmeez/src/views/parent/notifications/parent_notifications_screen.dart';


class ParentNavBarCubit extends Cubit<ParentNavBarStates>
{
  ParentNavBarCubit() : super(ParentLayoutInitial());

  static ParentNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.notifications,
      ),
      label: '',

    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.people,
      ),
      label: '',
    ),
  ];

  List<Widget> screens = [
    const ParentDashboardScreen(),
    const ParentNotificationsScreen(),
    const ParentInvitationsScreen(),
  ];


  void changeNavBar(int index)
  {
    currentIndex = index;
    emit(ParentLayoutChangeNavBar());
  }


}