import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/parent/student_navigation_bar/navigation_bar_cubit.dart';
import 'package:selaheltelmeez/src/bloc/parent/student_navigation_bar/navigation_bar_states.dart';
import 'package:selaheltelmeez/src/bloc/student/student_navigation_bar/navigation_bar_cubit.dart';
import 'package:selaheltelmeez/src/bloc/student/student_navigation_bar/navigation_bar_states.dart';
import 'package:selaheltelmeez/widgets/scaffold/navigation%20_bar_scaffold.dart';

class ParentNavBarScreen extends StatelessWidget {
  const ParentNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ParentNavBarCubit.get(context);
    return BlocConsumer<ParentNavBarCubit, ParentNavBarStates>(
      listener: (context, state) {},
      builder: (context, state) => NavigationBarScaffold(
          child: cubit.screens[cubit.currentIndex],
          navigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomNavBarItems,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: CommonColors.parentColor,
            type: BottomNavigationBarType.fixed,
            onTap: (index){
              cubit.changeNavBar(index);
            },
          ),
      ),
    );
  }
}
