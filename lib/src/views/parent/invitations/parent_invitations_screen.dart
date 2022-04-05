import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';
import 'package:sizer/sizer.dart';


class ParentInvitationsScreen extends StatelessWidget {
  const ParentInvitationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: CommonColors.parentColor,
                    width: double.infinity,
                    height: 64.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 64.0,
                      width: 64.0,
                      child: Icon(
                        Icons.people,
                        color: CommonColors.parentColor,
                        size: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding:  EdgeInsets.all(4.w),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom:6.w),
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
                                Text('ارسل علي احمد طلب اضافة'),
                                SizedBox(height: 2.w,),
                                Text('1/3/2022  03:38',

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 1.w),
                        child: CircleAvatar(
                          backgroundColor: CommonColors.parentColor,
                          radius: 2.w,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FancyElevatedButton(
                      title: 'موافق',
                      backGroundColor:
                      CommonColors.fancyElevatedButtonBackGroundColor,
                      titleColor: CommonColors.fancyElevatedTitleColor,
                      shadowColor:
                      CommonColors.fancyElevatedShadowTitleColor,
                      onPressed: () {

                      },
                    ),
SizedBox(width: 1.w,),
                    FancyElevatedButton(
                      title: 'رفض',
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

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CommonColors.fancyElevatedButtonBackGroundColor,
                    shape: BoxShape.circle,
                  ),
                  height: 120.0,
                  width: 120.0,
                  child: Icon(
                    Icons.announcement_outlined,
                    size: 32.0,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(''
                    'ليس لديك دعوات جديدة',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
