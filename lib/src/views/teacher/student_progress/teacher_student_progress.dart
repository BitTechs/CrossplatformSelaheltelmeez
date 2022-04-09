import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherStudentProgress extends StatelessWidget {
  const TeacherStudentProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
        title: 'اللغة العربية',
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage(AssetsImage.gameLand),
                      ),
                      SizedBox(height: 8.sp,),
                      Text(
                        'مستوي تقدمي في اللغة العربية',
                        style: TextStyle(fontSize: 12.sp,
                            color: Colors.black54),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'مجموع الدرجات ',
                            style: TextStyle(fontSize: 12.sp,
                                color: Colors.black54),
                          ),
                          Text(
                            '25',
                            style: TextStyle(fontSize: 12.sp,
                                color: CommonColors.studentHomeTopBar),
                          ),
                          Text(
                            '/',
                            style: TextStyle(fontSize: 12.sp,
                                color: Colors.black54),
                          ),
                          Text(
                            '2500',
                            style: TextStyle(fontSize: 12.sp,
                                color: CommonColors.studentHomeTopBar),
                          ),
                          Text(
                            ' درجة',
                            style: TextStyle(fontSize: 12.sp,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => itemUnitList(),
                        separatorBuilder: (context, index) => Container(
                          color: Colors.grey[300],
                          //height: 1.0,
                        ),
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget itemUnitList() => Padding(
    padding: EdgeInsets.all(8.sp),
    child: Container(
      decoration: BoxDecoration(
        color: CommonColors.inputBackgroundColor,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Text(
              'المحور 1',
              style: TextStyle(
                fontSize: 14.sp,
                color: CommonColors.studentHomeTopBar,
              ),
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
              itemCount: 5,
            ),
          ),
        ],
      ),
    ),
  );

  Widget itemLessonList() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 10.0,
      ),
      Text(
        'نص استماع مجدي يعقوب',
        style: TextStyle(fontSize: 12.sp),
      ),
      SizedBox(
        height: 10.0,
      ),
      LinearPercentIndicator(
        width: 65.w,
        lineHeight: 1.h,
        alignment: MainAxisAlignment.start,
        percent: 0.5,
        isRTL: true,
        padding: EdgeInsets.zero,
        trailing: Padding(
          padding: EdgeInsetsDirectional.only(start: 8.sp,),
          child: Text(
            "50.0%",
            style: TextStyle(fontSize: 12.sp,),
          ),
        ),
        barRadius: const Radius.circular(16),
        backgroundColor: Colors.grey[300],
        progressColor: Colors.amberAccent,
      ),
    ],
  );
}
