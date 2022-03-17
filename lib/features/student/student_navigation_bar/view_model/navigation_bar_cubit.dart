import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/features/student/classes/classes/view/student_classes_screen.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/view/student_dashboard_screen.dart';
import 'package:selaheltelmeez/features/student/games/games/view/student_games_screen.dart';
import 'package:selaheltelmeez/features/student/invitations/invitations/view/student_invitations_screen.dart';
import 'package:selaheltelmeez/features/student/notifications/notifications/view/student_notifications_screen.dart';
import 'package:selaheltelmeez/features/student/student_navigation_bar/view_model/navigation_bar_states.dart';

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