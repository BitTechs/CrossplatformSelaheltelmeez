import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.studentHomeTopBar,
        title: Text(
          'سلاح التلميذ',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.sp),
                                  color: Colors.grey[350],
                                ),
                                width: 12.w,
                                height: 17.h,
                              ),
                              Image.asset(AssetsImage.prizeBronze,
                                width: 12.w,
                                height: 12.w,
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 2.h),
                            child: Container(
                                width: 12.w,
                                child: Text('1000 نقطة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 1.w,),
                      Spacer(),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.sp),
                                  color: Colors.grey[350],
                                ),
                                width: 12.w,
                                height: 19.h,
                              ),
                              Image.asset(AssetsImage.prizeSilver,
                                width: 12.w,
                                height: 12.w,
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 2.h),
                            child: Container(
                                width: 12.w,
                                child: Text('1000 نقطة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.sp),
                                  color: Colors.grey[350],
                                ),
                                width: 12.w,
                                height: 21.h,
                              ),
                              Image.asset(AssetsImage.prizeGold,
                                width: 12.w,
                                height: 12.w,
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 2.h),
                            child: Container(
                                width: 12.w,
                                child: Text('1000 نقطة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),

                      Spacer(),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.sp),
                                  color: Colors.grey[350],
                                ),
                                width: 12.w,
                                height: 23.h,
                              ),
                              Image.asset(AssetsImage.prizePlatinum,
                                width: 12.w,
                                height: 12.w,
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 2.h),
                            child: Container(
                                width: 12.w,
                                child: Text('1000 نقطة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),

                      Spacer(),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.sp),
                              color: Colors.grey[350],
                            ),
                            width: 12.w,
                            height: 29.h,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                width: 12.w,
                                height: 32.h,
                              ),
                              Image.asset(AssetsImage.prizeCube,
                                width: 12.w,
                                height: 12.w,
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 2.h),
                            child: Container(
                                width: 12.w,
                                child: Text('1000 نقطة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Text('مجموع النقاط',
                        style: TextStyle(
                          color: CommonColors.studentHomeTopBar,
                        ),
                      ),
                      Text('1000',
                        style: TextStyle(
                          color: CommonColors.studentHomeTopBar,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  LinearPercentIndicator(
                    width: 82.w,
                    lineHeight: 2.h,
                    alignment: MainAxisAlignment.start,
                    percent: 0.3,
                    isRTL: true,
                    padding: EdgeInsets.zero,
                    barRadius: const Radius.circular(16),
                    backgroundColor: Colors.grey[300],
                    progressColor: Colors.amberAccent,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: BoxDecoration(
                          color: CommonColors.studentHomeTopBar,
                          borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.deepOrange,
                              width: 0.7.w
                            )
                        ),
                        child: Text('1000 نقطة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: BoxDecoration(
                            color: CommonColors.studentHomeTopBar,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.deepOrange,
                                width: 0.7.w
                            )
                        ),
                        child: Text('13000 نقطة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => itemList(),
                  separatorBuilder: (Context, index) => SizedBox(
                    height: 2.h,
                  ),
                  itemCount: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemList() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('عدد الاوسمة في مادة اللغة العربية',
          style: TextStyle(
            color: CommonColors.studentHomeTopBar,
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[300],
              ),
              child: Padding(
                padding:  EdgeInsets.all(1.h),
                child: Row(
                  children: [
                    Image.asset(AssetsImage.prizeBronze,
                    width: 7.h,
                      height: 7.h,
                    ),
                    SizedBox(width: 1.h),
                    Opacity(
                      opacity: 0.4,
                      child: Image.asset(AssetsImage.prizeSilver,
                        width: 7.h,
                        height: 7.h,
                      ),
                    ),
                    SizedBox(width: 1.h),
                    Opacity(
                      opacity: 0.4,
                      child: Image.asset(AssetsImage.prizeGold,
                        width: 7.h,
                        height: 7.h,
                      ),
                    ),
                    SizedBox(width: 1.h),
                    Opacity(
                      opacity: 0.4,
                      child: Image.asset(AssetsImage.prizePlatinum,
                        width: 7.h,
                        height: 7.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 2.h),
            Opacity(
              opacity: 0.4,
              child: Image.asset(AssetsImage.prizeCube,
                width: 7.h,
                height: 7.h,
              ),
            ),
          ],
        ),
      ],
    );

}
