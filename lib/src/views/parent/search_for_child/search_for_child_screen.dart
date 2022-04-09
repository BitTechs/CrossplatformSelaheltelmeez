import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';
import 'package:sizer/sizer.dart';

class SearchForChildScreen extends StatelessWidget {
  const SearchForChildScreen({Key? key}) : super(key: key);

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

            Padding(
              padding:  EdgeInsets.all(4.w),
              child: Column(
                children: [
                  const Text('ادخل البريد الاليكتروني او رقم الموبيل الخاص بالطالب لارسل طلب اضافة',
                    textAlign: TextAlign.center,),

                  SizedBox(height: 10.w,),
                  Row(
                    children: [

                      Expanded(
                        child: FancyTextFormField(
                          placeholderText: 'البريد الالكتروني - رقم الموبايل',
                          name: 'studentEmailOrMobile',
                          width:  MediaQuery.of(context).size.width,
                          validator: IsRequiredRule(validationError:  'هذا الحقل مطلوب'),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: (){},
                        child: const Image(
                          image: AssetImage(AssetsImage.search),
                          height: 56.0,
                          width: 56.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w,),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
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
                              SizedBox(width: 4.w,),
                              FancyElevatedButton(
                                title: 'ارسال دعوة',
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
