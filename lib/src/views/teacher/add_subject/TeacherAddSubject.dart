import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/data/student/entity/term_entity.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';


class TeacherAddSubject extends StatelessWidget {
  const TeacherAddSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
      title: "اسامة محمد",
      image: AssetsImage.teacherUser,
      isLocalImage: true,
      color: CommonColors.teacherColor,
      child: Padding(
        padding:  EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FancyDropDownFormField<String>(
                height: 7.h,
                name: 'year',
                hintTitle: 'الصف الدراسي',
                items: [
                  'الصف الرابع الابتدائي',
                   'الصف الخامس الابتدائي',
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
              FancyDropDownFormField<TermEntity>(
                height: 7.h,
                name: 'term',
                hintTitle: 'الفصل الدراسي',
                items: [
                  TermEntity(id: 1, name: 'الفصل الدراسي الاول'),
                  TermEntity(id: 2, name: 'الفصل الدراسي الثاني')
                ],
                itemBuilder: (context, item) => Text(
                  item.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                ),
                onChanged: (T) {},
              ),
              SizedBox(height: 4.w,),
              ListView.separated(
                 shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => subjectItem('الدراسات الاجتماعية', AssetsImage.all, context, () { }),
                  separatorBuilder: (context, index) => SizedBox(height: 1.w,),
                  itemCount: 6),

              FancyElevatedButton(
                title: 'تحديث',
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
      ),
    );
  }
  Widget subjectItem(
      String title, String image, dynamic context, VoidCallback? onPressed) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        InkWell(
          onTap: onPressed,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Padding(
                padding: EdgeInsets.all(4.w),
                child: SizedBox(
                  height: 8.h,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    AssetsImage.inputBackground,
                    color: CommonColors.inputBackgroundColor,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    width: 10.h,
                    height: 10.h,
                    //fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 12.sp),
                    ),
                  ),

                  Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: CommonColors.teacherColor,
                      onChanged: (value){},
                  ),
                  SizedBox(width: 4.w,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
