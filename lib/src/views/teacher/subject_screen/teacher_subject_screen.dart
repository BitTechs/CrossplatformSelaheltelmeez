import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherSubjectScreen extends StatelessWidget {
  const TeacherSubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
        title: 'اللغة العربية',
        color: CommonColors.teacherColor,
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 6.w),
                    child: SizedBox(
                      height: 8.h,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        AssetsImage.inputBackground,
                        color: CommonColors.inputBackgroundColor,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image(
                        width: 10.h,
                        height: 10.h,
                        //fit: BoxFit.fill,
                        image: const AssetImage(AssetsImage.ebookIcon),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        'دليل ولي الامر',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteNames.teacherSubjectTimeline);
                },
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 6.w),
                      child: SizedBox(
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        child: SvgPicture.asset(
                          AssetsImage.inputBackground,
                          color: CommonColors.inputBackgroundColor,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image(
                          width: 10.h,
                          height: 10.h,
                          //fit: BoxFit.fill,
                          image: const AssetImage(AssetsImage.timelineTable),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'جدول المناهج الزمني',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
