import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_parent_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class ParentSubjectScreen extends StatelessWidget {
  const ParentSubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyParentNavigatedAppScaffold(
        parentName: "احمد محمد",
        parentImage: AssetsImage.parentUser,
        childImage: AssetsImage.studentUser,
        childName: "ايسل احمد محمد",
        childGrade: "الصف السادس الابتدائي",
        isLocalImage: true,
        onPressed: (){
          Navigator.of(context).pushNamed(RouteNames.parentUsageReport);
        },
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Stack(
                alignment: AlignmentDirectional.topStart,
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
                    children:  [
                      Image(
                        width: 10.h,
                        height: 10.h,
                        //fit: BoxFit.fill,
                        image: AssetImage(AssetsImage.parentGuide),
                      ),
                      SizedBox(width: 4.w,),
                      Text('دليل ولي الامر',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4.h,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RouteNames.subjectStatistics);

                },
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
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
                      children:  [
                        Image(
                          width: 10.h,
                          height: 10.h,
                          //fit: BoxFit.fill,
                          image: AssetImage(AssetsImage.subjectStatistics),
                        ),
                        SizedBox(width: 4.w,),
                        Text('مستوي التقدم في المادة',
                          style: TextStyle(
                            fontSize: 14.sp,
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
    );
  }
}
