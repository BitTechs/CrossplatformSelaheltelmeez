import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_add_button.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherExamsScreen extends StatelessWidget {
  const TeacherExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
        title: 'الاختبارات',
        image: AssetsImage.homeworkDetails,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              FancyAddButton(
                width: 40.w,
                  title: 'إنشاء اختبار',
              onPressed: (){
                  Navigator.of(context).pushNamed(RouteNames.teacherAddExam);
              },
              ),
              SizedBox(height: 4.w,),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 14.w),
                    child: SizedBox(
                      height: 5.h,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        AssetsImage.inputBackground,
                        color: CommonColors.inputBackgroundColor,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'الاختبارات السابقة',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: CommonColors.studentHomeTopBar,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.w,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RouteNames.teacherExamScreen);
                },
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
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
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('تم ارسال اختبار 6 عربي'),
                              SizedBox(height: 2.w,),
                              Text('1/3/2022  03:38',

                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('عدد الطلاب'),
                            Container(
                              alignment: Alignment.center,
                              width: 18.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(30.w),
                                  bottomStart: Radius.circular(30.w), )
                              ),
                              child: Text('27',
                                  style: TextStyle(
                                    color: CommonColors.studentHomeTopBar,
                                    fontSize: 20.sp,
                                  ),

                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8.w,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.w,),
              Stack(
                alignment: AlignmentDirectional.centerStart,
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
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('تم ارسال اختبار 6 عربي'),
                            SizedBox(height: 2.w,),
                            Text('1/3/2022  03:38',

                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('عدد الطلاب'),
                          Container(
                            alignment: Alignment.center,
                            width: 18.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(30.w),
                                  bottomStart: Radius.circular(30.w), )
                            ),
                            child: Text('27',
                              style: TextStyle(
                                color: CommonColors.studentHomeTopBar,
                                fontSize: 20.sp,
                              ),

                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8.w,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
