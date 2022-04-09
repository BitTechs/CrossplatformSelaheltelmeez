import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_detailed_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherSubjectTimeline extends StatelessWidget {
  const TeacherSubjectTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyDetailedNavigatedAppScaffold(
        title: 'اللغة العربية',
        subtitle: 'الصف السادس الابتدائي',
        image: AssetsImage.all,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child:  ListView.separated(
          itemBuilder: (context, index) => itemUnitList(),
          separatorBuilder: (context, index) => Container(
            color: Colors.grey[300],
            //height: 1.0,
          ),
          itemCount: 10,
        ),
    );
  }

  Widget itemUnitList() => Padding(
    padding: EdgeInsets.all(8.sp),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
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
            Text(
              'شهر مايو',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: CommonColors.teacherColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.w,),
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: Row(
            children: [
              Text(
                'الوحدة الاولي المحور 1 : من اكون',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: CommonColors.studentHomeTopBar,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 8.sp,
            bottom: 8.sp,
            right: 8.sp,
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => itemLessonList(),
            itemCount: 3,
          ),
        ),
      ],
    ),
  );

  Widget itemLessonList() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 10.0,
      ),
      Text(
        'الدرس الاول',
        style: TextStyle(fontSize: 12.sp, color: CommonColors.studentHomeTopBar),
      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding:  EdgeInsetsDirectional.only(start: 4.w),
        child: Text(
          'نص استماع مجدي يعقوب',
          style: TextStyle(fontSize: 12.sp),
        ),
      ),
    ],
  );
}
