import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherExamResult extends StatelessWidget {
  const TeacherExamResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
        title: 'سلاح  التلميذ',
        color: CommonColors.teacherColor,
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Text(
                  'نتيجة الاختبار 8 من 10',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: CommonColors.studentHomeTopBar,
                  ),
                ),
                SizedBox(height: 6.w,),
                trueItem(),
                SizedBox(height: 4.w,),
                falseItem(),

            ],),
          ),
        ),
    );
  }

  Widget trueItem()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 4.w),
              child: Container(
                color: CommonColors.quizQuestionColor,
                width: double.infinity,
                child: Padding(
                  padding:  EdgeInsets.all(4.w),
                  child: Text('اقرأ، ثم أجب: وقد لفت طائر النعام أنظار اتلاميذ، فمع أنه طائر ضخم، فإن ه جناحين'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Text('السؤال 1 من 10'),
              ),

            )
          ],
        ),
        SizedBox(height: 4.w,),
        Stack(
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 8.5.w, end: 4.w),
              child: Container(
                width: double.infinity,
                height: 7.h*3,
                decoration: BoxDecoration(
                  color: CommonColors.inputBackgroundColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(80.h),
                    topEnd:Radius.circular(80.h),
                  ),
                ),
              ),
            ),
            Column(
              children: [

                RadioListTile(
                    title: Text('قوي'),
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: 1,
                    onChanged: (int? value){
                    }),
                RadioListTile(
                    title: Text('كبير'),
                    value: 2,
                    groupValue: 1,
                    onChanged: (int? value){
                    }),
                RadioListTile(
                    title: Text('ضئيل'),
                    value: 3,
                    groupValue: 1,
                    onChanged: (int? value){

                    }),
                SizedBox(height: 2.w,),
                Text(
                  'احابة صحيحة',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.green,
                  ),
                ),

              ],
            ),


          ],
        ),
      ],
    );
  }

  Widget falseItem()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 4.w),
              child: Container(
                color: CommonColors.quizQuestionColor,
                width: double.infinity,
                child: Padding(
                  padding:  EdgeInsets.all(4.w),
                  child: Text('اقرأ، ثم أجب: وقد لفت طائر النعام أنظار اتلاميذ، فمع أنه طائر ضخم، فإن ه جناحين'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Text('السؤال 2 من 10'),
              ),

            )
          ],
        ),
        SizedBox(height: 4.w,),
        Stack(
          children: [
            Padding(
              padding:  EdgeInsetsDirectional.only(start: 8.5.w, end: 4.w),
              child: Container(
                width: double.infinity,
                height: 7.h*3,
                decoration: BoxDecoration(
                  color: CommonColors.inputBackgroundColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(80.h),
                    topEnd:Radius.circular(80.h),
                  ),
                ),
              ),
            ),
            Column(
              children: [

                RadioListTile(
                    title: Text('قوي'),
                    value: 1,
                    activeColor: Colors.red,
                    groupValue: 1,
                    onChanged: (int? value){
                    }),
                RadioListTile(
                    title: Text('كبير'),
                    value: 2,
                    groupValue: 1,
                    onChanged: (int? value){
                    }),
                RadioListTile(
                    title: Text('ضئيل'),
                    value: 3,
                    groupValue: 1,
                    onChanged: (int? value){

                    }),
                SizedBox(height: 2.w,),
                Text(
                  'احابة خاطئة',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.red,
                  ),
                ),

              ],
            ),
          ],
        ),
      ],
    );
  }
}
