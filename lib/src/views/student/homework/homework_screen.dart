import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';
import 'package:sizer/sizer.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: CommonColors.studentHomeTopBar,
        title: Text(
          'واجب دراسي عربي',
          style: AppTheme.screenTitle,
        ),
      ),

      body: Padding(
        padding:  EdgeInsets.all(4.w),
        child: Column(
          children: [
            FancyTextFormField(
              placeholderText: 'الرسالة',
              name: 'message',
                  ),

            SizedBox(height: 2.w,),

            Stack(
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
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Text('اختار الملف المرفق',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AssetsImage.attach,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
const Spacer(),
            FancyElevatedButton(
              title: 'ارسال',
              width: 40.w,
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
    );
  }
}
