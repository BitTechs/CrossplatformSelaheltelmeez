import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherEditClass extends StatelessWidget {
  const TeacherEditClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
      title: 'تعديل بيانات الفصل',
      color: CommonColors.teacherColor,
      child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  FancyTextFormField(
                    placeholderText: 'تفاصيل الفصل',
                    name: 'class',
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 8.w),
                    child: Image(
                      width: 6.w,
                      height: 6.w,
                      image: AssetImage(
                        AssetsImage.copyText,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.w,),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  FancyTextFormField(
                    placeholderText: 'اسم الفصل',
                    name: 'className',
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 8.w),
                    child: Image(
                      width: 6.w,
                      height: 6.w,
                      image: AssetImage(
                        AssetsImage.copyText,
                      ),
                    ),
                  ),
                ],
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
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 6.h,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        AssetsImage.inputBackground,
                        color: CommonColors.inputBackgroundColor,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Text('كود الفصل'),
                          SizedBox(width: 6.w,),
                          Expanded(
                            child: Text('545211',
                              style: TextStyle(
                                color: CommonColors.studentHomeTopBar,
                              ),
                            ),
                          ),
                          Image(
                            width: 6.w,
                            height: 6.w,
                            image: AssetImage(
                              AssetsImage.copyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.w,),
              FancyElevatedButton(
                width: 25.w,
                title: 'تعديل',
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
