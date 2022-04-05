import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class ParentDetailedLessonReport extends StatefulWidget {
  const ParentDetailedLessonReport({Key? key}) : super(key: key);

  @override
  State<ParentDetailedLessonReport> createState() =>
      _ParentDetailedLessonReportState();
}

class _ParentDetailedLessonReportState
    extends State<ParentDetailedLessonReport> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
      title: "ايسل احمد محمد",
      color: CommonColors.parentColor,
      child: Column(
        children: [
          Container(
            height: 15.h,
            color: Colors.white,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => itemSubjectList(index),
              separatorBuilder: (context, index) => const SizedBox(
                width: 0.0,
              ),
              itemCount: 7,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
    );
  }

  Widget itemSubjectList(index) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScaledWidget(
          scale: (selectedItem == index) ? 1.3 : 1.0,
          opacity: (selectedItem == index) ? 1.0 : 0.6,
          onTap: () {
            setState(() {
              selectedItem = index;
            });
          },
          child: Image.asset(
            AssetsImage.all,
            height: 20.h,
            width: 20.w,
          ),
        ),
      );

  Widget itemUnitList() => Padding(
        padding: EdgeInsets.all(8.sp),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
            width: 75.w,
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
