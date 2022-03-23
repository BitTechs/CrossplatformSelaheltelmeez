import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/classes/class_search_cubit.dart';
import 'package:selaheltelmeez/src/bloc/student/classes/class_search_states.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_text_form_field.dart';

class ClassSearchScreen extends StatelessWidget {
   ClassSearchScreen({Key? key}) : super(key: key);

  final subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = ClassSearchCubit.get(context);
    return BlocConsumer<ClassSearchCubit, ClassSearchStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: CommonColors.studentHomeTopBar,
          title: Text(
              'البحث عن فصل',
            style: AppTheme.screenTitle,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,

        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cubit.changeSelectedTab(1);
                      },
                      child: Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: cubit.selectedTab == 1 ? Colors.amber : CommonColors.inputBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0),

                          ),
                        ),
                        child: const Text('سلاح التلميذ'
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cubit.changeSelectedTab(2);
                      },
                      child: Container(

                        height: 60.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: cubit.selectedTab == 2 ? Colors.amber : CommonColors.inputBackgroundColor,
                        ),
                        child: const Text('إسم / رقم'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        cubit.changeSelectedTab(3);
                      },
                      child: Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: cubit.selectedTab == 3 ? Colors.amber : CommonColors.inputBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            bottomLeft: Radius.circular(32.0),

                          ),
                        ),
                        child: const Text('كود الفصل'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              inputForm(cubit.selectedTab, context),
              const SizedBox(height: 10.0,),

              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => index == 0 ? itemWaitingClassesList() : itemClassesList(),
                    separatorBuilder: (context, index) => const SizedBox(height: 10.0,),
                    itemCount: 10
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }


  Widget inputForm(int selectedTab, context)
  {
    switch(ClassSearchCubit.get(context).selectedTab)
    {
      case 1:
        return Row(
          children: [

            Expanded(
              child: FancyDropDownFormField<String>(
                name: 'gradeMenu',
                width: MediaQuery.of(context).size.width,
                hintTitle: 'اختر المادة الدراسية',
                items: const [
                  'اللغة العربية',
                  'اللغة الانجليزية',
                  'الرياضيات',
                ],
                itemBuilder: (context, item) => Text(
                  item,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 14),
                ),
                onChanged: (value) {},
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
        );
      case 2:
        return Row(
          children: [

            Expanded(
              child: FancyTextFormField(
                placeholderText: 'اسم المعلم او رقم الموبايل',
                name: 'teacherNameOrMobile',
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
        );
      case 3:
        return Row(
          children: [

            Expanded(
              child: FancyTextFormField(
                placeholderText: 'ادخل كود الفصل',
                name: 'classCode',
                width:  MediaQuery.of(context).size.width,
                validator:  IsRequiredRule(validationError: 'هذا الحقل مطلوب'),
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
        );
      default:
        return Row();
    }
  }

  Widget itemClassesList() => Container(
    height: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        color: CommonColors.inputBackgroundColor
    ),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 50.0,
          child: Image(
            image: AssetImage(AssetsImage.microsoftAuth),
          ),
        ),
        const SizedBox(width: 10.0,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('عماد احمد'),
              Row(
                children: const [
                  Text('فصل'),
                  SizedBox(width: 5.0,),
                  Text('الزهور'),
                ],
              ),
              Row(
                children: [
                  const Text('الكود'),
                  const SizedBox(width: 5.0,),
                  Text('1049',
                    style: TextStyle(
                      color: CommonColors.studentHomeTopBar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        FancyElevatedButton(
          title: 'اشترك',
          backGroundColor:
          CommonColors.fancyElevatedButtonBackGroundColor,
          titleColor: CommonColors.fancyElevatedTitleColor,
          shadowColor:
          CommonColors.fancyElevatedShadowTitleColor,
          onPressed: () {
          },
        ),
        const SizedBox(width: 16.0,),
      ],
    ),
  );

   Widget itemWaitingClassesList() => Container(
     height: 100.0,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(200.0),
         color: CommonColors.inputBackgroundColor
     ),
     child: Row(
       children: [
         const CircleAvatar(
           radius: 50.0,
           child: Image(
             image: AssetImage(AssetsImage.microsoftAuth),
           ),
         ),
         const SizedBox(width: 10.0,),
         Expanded(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('عماد احمد'),
               Row(
                 children: const [
                   Text('فصل'),
                   SizedBox(width: 5.0,),
                   Text('الزهور'),
                 ],
               ),
               Row(
                 children: [
                   const Text('الكود'),
                   const SizedBox(width: 5.0,),
                   Text('1049',
                     style: TextStyle(
                       color: CommonColors.studentHomeTopBar,
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
         Container(
           width: 70.0,
           child: Text('في انتظار الموافقة',
             style: TextStyle(
               color: CommonColors.studentHomeTopBar,
             ),
           ),
         ),
         const SizedBox(width: 16.0,),
       ],
     ),
   );



}
