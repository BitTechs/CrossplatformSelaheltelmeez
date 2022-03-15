import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/student/layout/view_model/stduent_layout_states.dart';
import 'package:selaheltelmeez/features/student/layout/view_model/student_layout_cubit.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';
import 'package:selaheltelmeez/widgets/scaffold/navigation%20_bar_scaffold.dart';

class StudentLayoutScreen extends StatelessWidget {
  const StudentLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = StudentLayoutCubit.get(context);
    return BlocConsumer<StudentLayoutCubit, StudentLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) => NavigationBarScaffold(
          child: cubit.screens[cubit.currentIndex],
          navigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomNavBarItems,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: CommonColors.studentHomeTopBar,
            type: BottomNavigationBarType.fixed,
            onTap: (index){
              cubit.changeNavBar(index);
            },
          ),
      ),
    );
  }
}
