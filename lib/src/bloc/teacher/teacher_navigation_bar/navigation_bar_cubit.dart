import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/src/bloc/teacher/teacher_navigation_bar/navigation_bar_states.dart';
import 'package:selaheltelmeez/src/views/teacher/dashboard/teacher_dashboard_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/invitations/teacher_invitations_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/news/teacher_news_screen.dart';
import 'package:selaheltelmeez/src/views/teacher/notifications/teacher_notifications_screen.dart';

class TeacherNavBarCubit extends Cubit<TeacherNavBarStates>
{
  TeacherNavBarCubit() : super(TeacherLayoutInitial());

  static TeacherNavBarCubit get(context) => BlocProvider.of(context);

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
        Icons.language,
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
    const TeacherDashboardScreen(),
    const TeacherNewsScreen(),
    const TeacherNotificationsScreen(),
    const TeacherInvitationsScreen(),
  ];


  void changeNavBar(int index)
  {
    currentIndex = index;
    emit(TeacherLayoutChangeNavBar());
  }


}