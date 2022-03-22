import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/src/views/student/dashboard/student_dashboard_screen.dart';
import 'package:selaheltelmeez/src/bloc/student/student_navigation_bar/navigation_bar_states.dart';
import 'package:selaheltelmeez/src/views/student/classes/student_classes_screen.dart';
import 'package:selaheltelmeez/src/views/student/games/student_games_screen.dart';
import 'package:selaheltelmeez/src/views/student/invitations/student_invitations_screen.dart';
import 'package:selaheltelmeez/src/views/student/notifications/student_notifications_screen.dart';

class StudentNavBarCubit extends Cubit<StudentNavBarStates>
{
  StudentNavBarCubit() : super(StudentLayoutInitial());

  static StudentNavBarCubit get(context) => BlocProvider.of(context);

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
        Icons.class_,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.videogame_asset,
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
    const StudentDashboardScreen(),
    const StudentClassesScreen(),
    const StudentGamesScreen(),
    const StudentNotificationsScreen(),
    const StudentInvitationsScreen(),
  ];


  void changeNavBar(int index)
  {
    currentIndex = index;
    emit(StudentLayoutChangeNavBar());
  }


}