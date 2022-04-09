import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:sizer/sizer.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
      child: ScrollColumnExpandable(
        crossAxisAlignment: CrossAxisAlignment.start,
        headerWidgets: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 4.w),
                        child: Container(
                          height: 5.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: CommonColors.teacherColor,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(4.h)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 18.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "احمد علي",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  color: CommonColors.teacherColor,
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 4.w, start: 4.w, end: 4.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image(
                          image: AssetImage(AssetsImage.teacherUser),
                          height: 20.w,
                          width: 20.w,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 9.w),
                          child: Text(
                            "مرحبا",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FancyElevatedButton(
                            title: 'خروج',
                            backGroundColor:
                                CommonColors.fancyElevatedButtonBackGroundColor,
                            titleColor: CommonColors.fancyElevatedTitleColor,
                            shadowColor:
                                CommonColors.fancyElevatedShadowTitleColor,
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 2.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        centeredExpandedWidgets: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
          child: Column(
            children: [
              menuItem('المواد الدراسية', AssetsImage.subjects, context, () {
                Navigator.of(context).pushNamed(RouteNames.teacherSubjects);
              }),
              menuItem('الفصول الدراسية', AssetsImage.classes, context, () {
                Navigator.of(context).pushNamed(RouteNames.teacherClassesScreen);
              }),
              menuItem('الاختبارات', AssetsImage.exams, context, () {
                Navigator.of(context).pushNamed(RouteNames.teacherExamsScreen);
              }),
              menuItem('الواجبات الدراسية', AssetsImage.classExam, context, () {
                   Navigator.of(context).pushNamed(RouteNames.teacherHomeworks);
              }),
              menuItem('التقارير والمراجعات', AssetsImage.statisticsChart,
                  context, () {}),
            ],
          ),
        ),
        footerWidgets: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(4.w),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        SizedBox(
                          height: 7.h,
                          width: 60.w,
                          child: SvgPicture.asset(
                            AssetsImage.inputBackground,
                            color: CommonColors.inputBackgroundColor,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              width: 10.h,
                              //height: 5.h,
                              fit: BoxFit.fill,
                              image: const AssetImage(AssetsImage.teacherAsk),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text('اسأل سلاح التلميذ'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    SizedBox(
                      height: 14.h,
                      width: 60.w,
                      child: Image(
                        image: AssetImage(AssetsImage.teacherCode),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 14.w,
                          child: Text(
                            'كود المدرس',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: 10.sp, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          '6yth654841',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  color: CommonColors.teacherColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 4.w,
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
