import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherAddClass extends StatelessWidget {
  const TeacherAddClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
      title: "انشاء فصل",
      color: CommonColors.teacherColor,
      child: Padding(
        padding:  EdgeInsets.all(4.w),
        child: Column(
          children: [
            FancyTextFormField(
              placeholderText: 'تفاصيل الفصل',
              name: 'class',
            ),
            SizedBox(height: 4.w,),
            FancyTextFormField(
              placeholderText: 'اسم الفصل',
              name: 'className',
            ),
            SizedBox(height: 4.w,),
            FancyDropDownFormField<String>(

              name: 'subject',
              hintTitle: 'الصف الدراسي',
              items: [
                'الرياضيات',
                'اللغة العربية',
              ],
              itemBuilder: (context, item) => Text(
                item,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14),
              ),
              onChanged: (T) {},
            ),

            const Spacer(),

            FancyElevatedButton(
              title: 'إنشاء الفصل',
              backGroundColor:
              CommonColors.fancyElevatedButtonBackGroundColor,
              titleColor: CommonColors.fancyElevatedTitleColor,
              shadowColor:
              CommonColors.fancyElevatedShadowTitleColor,
              onPressed: () {},
            ),
          ],
        ),
      ),

    );
  }
}
