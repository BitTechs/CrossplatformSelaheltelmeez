import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherExamsDetails extends StatelessWidget {
  const TeacherExamsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
      title: 'تفاصيل الاختبارات والواجبات',
        image: AssetsImage.homeworkDetails,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
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
            ],
          ),
        ),
    );
  }
}
