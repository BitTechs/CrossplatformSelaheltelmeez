import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';

import '../../../../widgets/buttons/fancy_elevated_button.dart';

class StudentClassesScreen extends StatelessWidget {
  const StudentClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
        child: Column(
          children: [
            Container(
              color: CommonColors.studentHomeTopBar,
              width: double.infinity,
              child: Text(''
                  'قائمة فصولي',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
                 ),
            ),
            SizedBox(
              height: 30.0,
            ),
            FancyElevatedButton(
              title: 'اشترك في فصل جديد',
              backGroundColor:
              CommonColors.fancyElevatedButtonBackGroundColor,
              titleColor: CommonColors.fancyElevatedTitleColor,
              shadowColor:
              CommonColors.fancyElevatedShadowTitleColor,
              onPressed: () {},
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(''
                'لم تقم بالاشتراك في اي فصل في الوقت الحالي',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
          ],
        ),
    );
  }
}
