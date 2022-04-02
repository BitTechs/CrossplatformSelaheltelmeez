import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/dashboard/curriculum_cubit.dart';
import 'package:selaheltelmeez/src/bloc/student/dashboard/recent_lessons_progress_cubit.dart';
import 'package:selaheltelmeez/src/data/student/entity/term_entity.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_add_button.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:sizer/sizer.dart';

class ParentDashboardScreen extends StatelessWidget {
  const ParentDashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
        child: ScrollColumnExpandable(
          crossAxisAlignment: CrossAxisAlignment.start,
          headerWidgets: Stack(
            children: [
              Container(
                color: CommonColors.parentColor,
                height: 9.h,
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(top: 4.w, start: 4.w, end: 4.w ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: Image(
                        image: AssetImage(AssetsImage.parentUser),
                        height: 20.w,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(width: 4.w,),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 9.w),
                        child: Text("احمد محمد",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    FancyElevatedButton(
                      title: 'خروج',
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
          centeredExpandedWidgets: Padding(
            padding:  EdgeInsets.all(4.w),
            child: Column(
              children: [
                FancyAddButton(
                  title: "اضافة ابن - طالب",
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteNames.addChild);
                  },
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(RouteNames.childScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top:6.w),
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
                                      Text('لين أحمد'),
                                      SizedBox(height: 2.w,),
                                      Text('الصف الرابع الابتدائي',

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsetsDirectional.only(end: 6.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(
                            width: 5.h,
                            height: 5.h,
                            fit: BoxFit.fill,
                            image: const AssetImage(AssetsImage.subscribe),
                          ),
                          SizedBox(width: 4.w,),
                          Image(
                            width: 5.h,
                            height: 5.h,
                            fit: BoxFit.fill,
                            image: const AssetImage(AssetsImage.remove),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),




              ],
            ),
          ),
          footerWidgets: Padding(
            padding:  EdgeInsets.all(4.w),
            child: InkWell(
              onTap: (){},
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  SizedBox(
                    height: 7.h,
                    width: 60.w,
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
                        //height: 5.h,
                        fit: BoxFit.fill,
                        image: const AssetImage(AssetsImage.ask),
                      ),
                      SizedBox(width: 4.w,),
                      Text('اسأل سلاح التلميذ'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        );
  }
}
