import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';
import 'package:sizer/sizer.dart';

class RegisterChildScreen extends StatelessWidget {
  const RegisterChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
                children: [
                  Image(
                    height: 30.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: const AssetImage(AssetsImage.parentHeader),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ],
              ),

            SizedBox(height: 10.w,),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.all(4.w),
                  child: Column(
                    children: [
                      const Text('سيتم انشاء حساب لطفلك تابع لحسابك و يستطيع طفلك الدخول الي حاسبه من خلاص صفحتك الرئيسيه',
                        textAlign: TextAlign.center,),

                      SizedBox(height: 10.w,),
                      FancyTextFormField(
                        placeholderText: "الاسم بالكامل",
                        name: 'fullName',
                      ),
                      SizedBox(height: 4.w,),
                      FancyDropDownFormField<String>(
                        name: 'grade',
                        hintTitle: " الصف الدراسي",
                        items: const ['الثاني الابتدائي', 'الاول الابتدائي'],
                        itemBuilder: (context, item) => Text(item),
                        onChanged: (S){},
                      ),
                      SizedBox(height: 4.w,),

                      FancyDropDownFormField<String>(
                          name: 'birthDate',
                          hintTitle: "سنة الميلاد",
                          items: const ['1990', '1999', '2000'],
                          itemBuilder: (context, item) => Text(item),
                          onChanged: (S){},
                      ),
                      SizedBox(height: 8.w,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("اختر النوع"),
                          ScaledButtonAssetImage(
                            scale:  1.5 ,
                            opacity:  1.0,
                            onTap: () {},
                            imageUrl: AssetsImage.female,
                          ),
                          ScaledButtonAssetImage(
                            scale: 1.0,
                            opacity:  0.6,
                            onTap: () => {},
                            imageUrl: AssetsImage.male,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w,),
                      FancyElevatedButton(
                        title: 'تسجيل',
                        width: 50.w,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
