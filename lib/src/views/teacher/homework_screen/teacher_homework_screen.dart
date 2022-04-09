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

class TeacherHomeworkScreen extends StatelessWidget {
  const TeacherHomeworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
      title: 'واجب 6 عربي',
      color: CommonColors.teacherColor,
      image: AssetsImage.homeworkCircle,
      isLocalImage: true,
      child: Padding(
        padding:  EdgeInsets.all(4.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تم ارسال واجب 6 عربي',
                style: TextStyle(
                  color: CommonColors.studentHomeTopBar
                ),),
                SizedBox(width: 8.w,),
                Text('1/1/2022',
                  style: TextStyle(
                      color: CommonColors.studentHomeTopBar
                  ),),
              ],
            ),
            SizedBox(height: 4.w,),
            FancyDropDownFormField<String>(
              height: 6.h,
              name: 'classes',
              hintTitle: 'الفصول المشاركة',
              items: [
                'فصل الزهور',
                'فصل الاوائل',
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
            SizedBox(height: 8.w,),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                SizedBox(
                  height: 10.h,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    AssetsImage.inputBackground,
                    color: CommonColors.inputBackgroundColor,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Image(
                      width: 10.h,
                      height: 10.h,
                      //fit: BoxFit.fill,
                      image: AssetImage(AssetsImage.parentUser),
                    ),
                    SizedBox(width: 4.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('اسيا احمد مصطفي'),
                          SizedBox(height: 2.w,),
                          Row(
                            children: [
                              Text('تم الرد',
                                style: TextStyle(
                                    color: CommonColors.studentHomeTopBar
                                ),),

                              SizedBox(width: 2.w,),

                              Text('1/1/2022',),

                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4.w,),
                    FancyElevatedButton(
                      title: 'الاجابة',
                      backGroundColor:
                      CommonColors.fancyElevatedButtonBackGroundColor,
                      titleColor: CommonColors.fancyElevatedTitleColor,
                      shadowColor:
                      CommonColors.fancyElevatedShadowTitleColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.teacherExamResult);

                      },
                    ),
                    SizedBox(width: 4.w,),
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
