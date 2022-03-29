import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var quizController = PageController();
  int? radioValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: CommonColors.studentHomeTopBar,
        title: Text(
          'سلاح التلميذ',
          style: AppTheme.screenTitle,
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('متبقي 9 دقائق و 10 ثواني',
          style: TextStyle(
            color: CommonColors.studentHomeTopBar,
            fontWeight: FontWeight.bold,
          ),
          ),

          SizedBox(height: 4.w,),

          Expanded(
            child: PageView.builder(
              controller: quizController,
              itemBuilder: (context, index) => quizItem(index),
              itemCount: 10,
            ),
          ),

          SizedBox(height: 4.w,),

          SmoothPageIndicator(
              controller: quizController,
              effect: JumpingDotEffect(
                verticalOffset: -15.0,
                activeDotColor: CommonColors.studentHomeTopBar,
                dotHeight: 3.w,
                dotWidth: 3.w,

              ),
              count: 10),

          SizedBox(height: 4.w,),

          FancyElevatedButton(
            title: 'التالي',
            backGroundColor:
            CommonColors.fancyElevatedButtonBackGroundColor,
            width: 40.w,
            titleColor: CommonColors.fancyElevatedTitleColor,
            shadowColor:
            CommonColors.fancyElevatedShadowTitleColor,
            onPressed: () {
                quizController.nextPage(
                    duration: Duration(milliseconds: 750),
                    curve: Curves.easeIn,
                );
            },
          ),

          SizedBox(height: 10.w,),


        ],
      ),
    );
  }

  Widget quizItem(int index) => Column(
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
              child: Text('السؤال ${index+1} من 10'),
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
                  groupValue: radioValue,
                  onChanged: (int? value){
                    setState(() {
                      radioValue = value;
                    });
                  }),
              RadioListTile(
                  title: Text('كبير'),
                  value: 2,
                  groupValue: radioValue,
                  onChanged: (int? value){
                    setState(() {
                      radioValue = value;
                    });
                  }),
              RadioListTile(
                  title: Text('ضئيل'),
                  value: 3,
                  groupValue: radioValue,
                  onChanged: (int? value){
                    setState(() {
                      radioValue = value;
                    });
                  }),

            ],
          ),
        ],
      ),


    ],
  );
}
