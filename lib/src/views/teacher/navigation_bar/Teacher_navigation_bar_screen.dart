import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/teacher/teacher_navigation_bar/navigation_bar_cubit.dart';
import 'package:selaheltelmeez/src/bloc/teacher/teacher_navigation_bar/navigation_bar_states.dart';
import 'package:selaheltelmeez/widgets/scaffold/navigation%20_bar_scaffold.dart';

class TeacherNavBarScreen extends StatelessWidget {
  const TeacherNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TeacherNavBarCubit.get(context);
    return BlocConsumer<TeacherNavBarCubit, TeacherNavBarStates>(
      listener: (context, state) {},
      builder: (context, state) => NavigationBarScaffold(
          child: cubit.screens[cubit.currentIndex],
          navigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomNavBarItems,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: CommonColors.teacherColor,
            type: BottomNavigationBarType.fixed,
            onTap: (index){
              cubit.changeNavBar(index);
            },
          ),
      ),
    );
  }
}
