import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';

class TeacherNewsScreen extends StatelessWidget {
  const TeacherNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: CommonColors.teacherColor,
                    width: double.infinity,
                    height: 64.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 64.0,
                      width: 64.0,
                      child: Icon(
                        Icons.language,
                        color: CommonColors.teacherColor,
                        size: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),


          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CommonColors.fancyElevatedButtonBackGroundColor,
                    shape: BoxShape.circle,
                  ),
                  height: 120.0,
                  width: 120.0,
                  child: Icon(
                    Icons.announcement_outlined,
                    size: 32.0,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(''
                    '???????????? ??????????',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
