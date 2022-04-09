import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherJoinedStudents extends StatelessWidget {
  const TeacherJoinedStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
        title: "عرض الطلاب المشتركين",
        image: AssetsImage.joinedStudentsCircle,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(RouteNames.teacherStudentScreen);
            },
              child: listItem()),
    separatorBuilder: (context, index) => SizedBox(height: 4.w,),
    itemCount: 8,
    ),

    ),
    );
  }

  Widget listItem()
  {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SizedBox(
          height: 10.h,
          width: double.infinity,
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
              image: AssetImage(AssetsImage.studentUser),
            ),
            SizedBox(width: 4.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('اسيا احمد مصطفي'),
                  SizedBox(height: 2.w,),
                  Text('1/3/2022',

                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
