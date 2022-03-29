import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:sizer/sizer.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          toolbarHeight: 15.h,
          //centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            children: [
              Container(
                color: CommonColors.studentHomeTopBar,
                height: 10.h,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(top: 2.w),
                          child: Text(
                            'فصل الفراشات',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Image(
                        width: 110,
                        height: 110,
                        image: AssetImage(AssetsImage.parentUser),
                        //fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        body: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [

              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 10.h,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: CommonColors.inputBackgroundColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image(
                        width: 10.h,
                        height: 10.h,
                        //fit: BoxFit.fill,
                        image: AssetImage(AssetsImage.classExam),
                      ),
                      SizedBox(width: 4.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('واجب دراسي عربي'),
                            SizedBox(height: 2.w,),
                            Row(
                              children: [
                                Text('تم الرد',
                                style: TextStyle(
                                  color: CommonColors.studentHomeTopBar
                                ),
                                ),
                                SizedBox(width: 2.w,),
                                Text('1/3/2022',),
                          ],
                        ),
                        ],
                      ),
                      ),

                      Padding(
                        padding:  EdgeInsetsDirectional.only(end: 6.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.airplay,
                              size: 16,
                            ),
                            SizedBox(height: 2.w,),
                            FancyElevatedButton(
                              title: 'عرض',
                              backGroundColor:
                              CommonColors.fancyElevatedButtonBackGroundColor,
                              titleColor: CommonColors.fancyElevatedTitleColor,
                              shadowColor:
                              CommonColors.fancyElevatedShadowTitleColor,
                              onPressed: () {
                                Navigator.of(context).pushNamed(RouteNames.homeworkScreen);

                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              SizedBox(height: 4.w,),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 10.h,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: CommonColors.inputBackgroundColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image(
                        width: 10.h,
                        height: 10.h,
                        //fit: BoxFit.fill,
                        image: AssetImage(AssetsImage.classHomework),
                      ),
                      SizedBox(width: 4.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار عربي'),
                            SizedBox(height: 2.w,),
                            Row(
                              children: [
                                Text('لم يبدأ الاختبار بعد',
                                  style: TextStyle(
                                      color: CommonColors.studentHomeTopBar
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsetsDirectional.only(end: 6.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.airplay,
                              size: 16,
                            ),
                            SizedBox(height: 2.w,),
                            FancyElevatedButton(
                              title: 'عرض',
                              backGroundColor:
                              CommonColors.fancyElevatedButtonBackGroundColor,
                              titleColor: CommonColors.fancyElevatedTitleColor,
                              shadowColor:
                              CommonColors.fancyElevatedShadowTitleColor,
                              onPressed: () {
                                Navigator.of(context).pushNamed(RouteNames.homeworkDetailedScreen);

                                  },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              SizedBox(height: 4.w,),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 10.h,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: CommonColors.inputBackgroundColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image(
                        width: 10.h,
                        height: 10.h,
                        //fit: BoxFit.fill,
                        image: AssetImage(AssetsImage.classExam),
                      ),
                      SizedBox(width: 4.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('واجب دراسي عربي'),
                            SizedBox(height: 2.w,),
                            Row(
                              children: [
                                Text('لم يتم الرد',
                                  style: TextStyle(
                                      color: CommonColors.studentHomeTopBar
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Text('1/3/2022',),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsetsDirectional.only(end: 6.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.airplay,
                              size: 16,
                            ),
                            SizedBox(height: 2.w,),
                            FancyElevatedButton(
                              title: 'عرض',
                              backGroundColor:
                              CommonColors.fancyElevatedButtonBackGroundColor,
                              titleColor: CommonColors.fancyElevatedTitleColor,
                              shadowColor:
                              CommonColors.fancyElevatedShadowTitleColor,
                              onPressed: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),


              SizedBox(height: 4.w,),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 10.h,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: CommonColors.inputBackgroundColor,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image(
                        width: 10.h,
                        height: 10.h,
                        //fit: BoxFit.fill,
                        image: AssetImage(AssetsImage.classHomework),
                      ),
                      SizedBox(width: 4.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار عربي'),
                            SizedBox(height: 2.w,),
                            Row(
                              children: [
                                Text('نتيجة الاختبار:'),
                                SizedBox(width: 2.w,),
                                Text('8/10',
                                  style: TextStyle(
                                      color: CommonColors.studentHomeTopBar
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsetsDirectional.only(end: 6.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.airplay,
                              size: 16,
                            ),
                            SizedBox(height: 2.w,),
                            FancyElevatedButton(
                              title: 'عرض',
                              backGroundColor:
                              CommonColors.fancyElevatedButtonBackGroundColor,
                              titleColor: CommonColors.fancyElevatedTitleColor,
                              shadowColor:
                              CommonColors.fancyElevatedShadowTitleColor,
                              onPressed: () {
                                Navigator.of(context).pushNamed(RouteNames.quizScreen);

                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
