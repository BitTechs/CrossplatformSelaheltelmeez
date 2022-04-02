import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/data/student/entity/term_entity.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/layouts/image_with_bottom_header.dart';
import 'package:selaheltelmeez/widgets/layouts/scroll_column_expandable.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_parent_navigated_app_scaffold.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class ChildScreen extends StatelessWidget {
  const ChildScreen({Key? key}) : super(key: key);

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
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 40.w,
                          child: SvgPicture.asset(
                            AssetsImage.inputBackground,
                            color: Colors.amberAccent,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Image(
                              width: 5.h,
                              height: 5.h,
                              fit: BoxFit.fill,
                              image: const AssetImage(AssetsImage.subscribeBtn),
                            ),
                            SizedBox(width: 4.w,),
                            Text('اشترك الان',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6.w,),
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 40.w,
                          child: SvgPicture.asset(
                            AssetsImage.inputBackground,
                            color: Colors.amberAccent,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Image(
                              width: 5.h,
                              height: 5.h,
                              fit: BoxFit.fill,
                              image: const AssetImage(AssetsImage.classExam),
                            ),
                            SizedBox(width: 4.w,),
                            Text('ابداء المذاكرة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.w,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "المواد الدراسية",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Builder(builder: (context) {
                      return FancyDropDownFormField<TermEntity>(
                        height: 7.h,
                        name: 'term',
                        hintTitle: 'اختر الفصل الدراسي',
                        items: [
                          TermEntity(id: 1, name: 'الفصل الدراسي الاول'),
                          TermEntity(id: 2, name: 'الفصل الدراسي الثاني')
                        ],
                        itemBuilder: (context, item) => Text(
                          item.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 14),
                        ),
                        onChanged: (T) {},
                      );
                    }),
                  )
                ],
              ),
              SizedBox(height: 6.w,),
              Container(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteNames.parentSubject);
                    },
                    child: ImageWithFloatingBottomHeader(
                      image: AssetsImage.teacherUser,
                      header: "اللغة العربية",
                      headerColor: Colors.black,
                      headerBackgroundColor: Colors.white,
                      alignment: Alignment.bottomCenter,
                      isNetworkImage: false,
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 2.w,),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 6.w,),
              Text(
                "المعلمين",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 2.w,),
              Container(
                height: 9.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.teacherScreen);
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 4.w),
                          child: Container(
                            height: 8.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12,),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Image(
                              width: 9.h,
                              height: 9.h,
                              fit: BoxFit.fill,
                              image: const AssetImage(AssetsImage.studentUser),
                            ),
                            SizedBox(width: 4.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('اسامة',),
                                Text('اللغة العربية',),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 2.w,),
                  itemCount: 10,
                ),
              ),

              SizedBox(height: 6.w,),
              Text(
                "الفصول",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 2.w,),
              Container(
                height: 13.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.classroom);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12,),
                      ),
                      child:  Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('اسم الفصل',),
                            Text('اللغة العربية',),
                            Text('اسامة',),
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 2.w,),
                  itemCount: 10,
                ),
              ),

              SizedBox(height: 6.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FancyElevatedButton(
                    title: 'حذف الطالب',
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
            ],
          ),
        ),
      ),
    );
  }
}
