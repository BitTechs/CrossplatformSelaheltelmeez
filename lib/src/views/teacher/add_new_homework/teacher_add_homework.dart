import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherAddHomework extends StatelessWidget {
  const TeacherAddHomework({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
      title: 'انشاء واجب دراسي',
      color: CommonColors.teacherColor,
      image: AssetsImage.homeworkCircle,
      isLocalImage: true,
      child: Padding(
        padding:  EdgeInsets.all(4.w),
        child: Column(
          children: [
            FancyDropDownFormField<String>(
              height: 6.h,
              name: 'subject',
              hintTitle: 'اختر الفصل الدراسي',
              items: [
                'الفصل الدراسي الاول',
                'الفصل الدراسي الثاني',
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
            SizedBox(height: 4.w,),
            FancyTextFormField(
              height: 6.h,
              placeholderText: 'اسم الفصل',
              name: 'title',
            ),
            SizedBox(height: 4.w,),
            FancyTextFormField(
              height: 6.h,
              placeholderText: 'الرسالة',
              name: 'massage',
            ),
            SizedBox(height: 4.w,),

            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                FancyTextFormField(
                  height: 6.h,
                  placeholderText: 'اختر الملف المرفق',
                  name: 'file',
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 8.w),
                  child: SvgPicture.asset(
                    AssetsImage.attach,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.w,),
            Row(
              children: [
                const Text('بداية الارسال'),
                SizedBox(width: 4.w,),
                FancyTextFormField(
                  width: 60.w,
                  height: 6.h,
                  placeholderText: '',
                  name: 'title',
                ),
              ],
            ),

            SizedBox(height: 4.w,),
            Row(
              children: [
                const Text('بداية الارسال'),
                SizedBox(width: 4.w,),
                FancyTextFormField(
                  width: 60.w,
                  height: 6.h,
                  placeholderText: '',
                  name: 'title',
                ),
              ],
            ),

            const Spacer(),

            FancyElevatedButton(
              width: 30.w,
              title: 'ارسال',
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
