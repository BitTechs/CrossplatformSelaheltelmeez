import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);

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

      body: Padding(
        padding:  EdgeInsets.all(8.w),
        child: Row(
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
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        color: Colors.grey[350],
                      ),
                      width: 12.w,
                      height: 29.h,
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
      ),
    );
  }
}
