import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class StudentClassesScreen extends StatelessWidget {
  const StudentClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
        child: Column(
          children: [
            Container(
              color: CommonColors.studentHomeTopBar,
              width: double.infinity,
              child: Text(''
                  'قائمة فصولي',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
                 ),
            ),
            SizedBox(
              height: 30.0,
            ),
            FancyElevatedButton(
              title: 'اشترك في فصل جديد',
              backGroundColor:
              CommonColors.fancyElevatedButtonBackGroundColor,
              titleColor: CommonColors.fancyElevatedTitleColor,
              shadowColor:
              CommonColors.fancyElevatedShadowTitleColor,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteNames.classSearch);
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(''
                'لم تقم بالاشتراك في اي فصل في الوقت الحالي',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RouteNames.classScreen);
                },
                child: Stack(
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
                          image: AssetImage(AssetsImage.all),
                        ),
                        SizedBox(width: 4.w,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('علي احمد'),
                              SizedBox(height: 2.w,),
                              Text('فصل الفراشات',

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
          ],
        ),
    );
  }
}
