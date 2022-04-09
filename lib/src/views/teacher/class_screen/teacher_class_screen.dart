import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherClassScreen extends StatelessWidget {
  const TeacherClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
        title: 'الصف الخامس الابتدائي',
        image: AssetsImage.classesCricle,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              menuItem('تعديل بيانات الفصل', AssetsImage.editClass, context, () {
                Navigator.of(context).pushNamed(RouteNames.teacherEditClass);
              }),
              menuItem('عرض الطلاب المشتركين', AssetsImage.joinedStudents, context, () {
                Navigator.of(context).pushNamed(RouteNames.teacherJoinedStudents);
              }),
              menuItem('تفاصيل الاختبارات والواجبات', AssetsImage.examsDetails, context, () {
                Navigator.of(context).pushNamed(RouteNames.teacherExamsDetails);
              }),

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
                title: 'حذف',
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

  Widget menuItem(
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
                  height: 6.h,
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
                    width: 8.h,
                    height: 8.h,
                    //fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}
