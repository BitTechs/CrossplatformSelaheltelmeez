import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherStudentScreen extends StatelessWidget {
  const TeacherStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
        title: "اسيا احمد مصطفي",
        image: AssetsImage.studentUser,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
            Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RouteNames.teacherStudentProgress);

                },
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
                          image: AssetImage(AssetsImage.statisticsChart),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "متسوي تقدم الطالب في المادة",
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
          ),
              SizedBox(height: 4.w,),
              Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 8.w),
                    child: Container(
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: CommonColors.inputBackgroundColor,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  Image(
                    width: 10.h,
                    height: 10.h,
                    //fit: BoxFit.fill,
                    image: AssetImage(AssetsImage.classExam),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: 12.w),
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 18.w),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              SizedBox(
                                height: 5.h,

                                child: SvgPicture.asset(
                                  AssetsImage.inputBackground,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Text('عنوان الاختبار'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.w,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                                child: SvgPicture.asset(
                                  AssetsImage.inputBackground,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Text('نتيجة الاختبار'),
                                  SizedBox(width: 2.w,),
                                  Text('18/20',
                                    style: TextStyle(
                                      color: CommonColors.studentHomeTopBar,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.w,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                                child: SvgPicture.asset(
                                  AssetsImage.inputBackground,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Text('تاريخ البدء'),
                                  SizedBox(width: 2.w,),
                                  Text('2022/3/1',
                                    style: TextStyle(
                                      color: CommonColors.studentHomeTopBar,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.w,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                                child: SvgPicture.asset(
                                  AssetsImage.inputBackground,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Text('تاريخ الانتهاء'),
                                  SizedBox(width: 2.w,),
                                  Text('2022/3/1',
                                    style: TextStyle(
                                      color: CommonColors.studentHomeTopBar,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Spacer(),
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
        ));
  }
}
