import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/features/student/classes/presentation_layer/student_classes_screen.dart';
import 'package:selaheltelmeez/features/student/games/presentation_layer/student_Games_screen.dart';
import 'package:selaheltelmeez/features/student/home/view/student_home_screen.dart';
import 'package:selaheltelmeez/features/student/invitations/presentation_layer/student_invitations_screen.dart';
import 'package:selaheltelmeez/features/student/layout/view_model/stduent_layout_states.dart';
import 'package:selaheltelmeez/features/student/notifications/presentation_layer/student_notifications_screen.dart';

class StudentLayoutCubit extends Cubit<StudentLayoutStates>
{
  StudentLayoutCubit() : super(StudentLayoutInitial());

  static StudentLayoutCubit get(context) => BlocProvider.of(context);

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
    const StudentHomeScreen(),
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