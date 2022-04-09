import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/objectbox.g.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_add_button.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherClassesScreen extends StatelessWidget {
  const TeacherClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
        title: 'الفصول الدراسية',
        image: AssetsImage.classesCricle,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              FancyAddButton(
                width: 40.w,
                  title: 'إضافة فصل',
                onPressed: (){
                  Navigator.of(context).pushNamed(RouteNames.teacherAddClass);
                },
              ),
              SizedBox(height: 8.w,),

              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RouteNames.teacherClassScreen);
                },
                child: Column(
                  children: [
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
                          'فصل المجتهدين',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: CommonColors.studentHomeTopBar,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.w,),
                    Container(
                      decoration: BoxDecoration(
                        color: CommonColors.inputBackgroundColor,
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      child:
                      Padding(
                        padding:  EdgeInsets.all(6.w),
                        child: Column(
                         children: [
                           Row(
                             children: [
                               Text('كود الفصل'),
                               SizedBox(width: 6.w,),
                               Expanded(
                                 child: Text('545211',
                                 style: TextStyle(
                                   color: CommonColors.studentHomeTopBar,
                                 ),
                                 ),
                               ),
                               Image(
                                 width: 6.w,
                                 height: 6.w,
                                 image: AssetImage(
                                     AssetsImage.copyText,
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: 6.w,),
                           Row(
                             children: [
                               Text('عدد الطلاب'),
                               SizedBox(width: 6.w,),
                               Expanded(
                                 child: Text('37',
                                   style: TextStyle(
                                     color: CommonColors.studentHomeTopBar,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
