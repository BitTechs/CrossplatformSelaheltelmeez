import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/layouts/image_with_bottom_header.dart';
import 'package:sizer/sizer.dart';

class HomeworkDetailedScreen extends StatelessWidget {
  const HomeworkDetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
            toolbarHeight: 15.h,
            //centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Stack(
              children: [
                Container(
                  color: CommonColors.studentHomeTopBar,
                  height: 10.h,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(top: 2.w),
                            child: Text(
                              'تفاصيل الاختبارات والواجبات',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 13.sp,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Image(
                          width: 110,
                          height: 110,
                          image: AssetImage(AssetsImage.homeworkDetails),
                          //fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          body:Padding(
            padding:  EdgeInsets.all(8.w),
            child: ListView.separated(
                itemBuilder: (context, index) => homeworkDetailedItem(),
                separatorBuilder: (context, index) => SizedBox(height: 4.w,),
                itemCount: 4),
          ),


        ),
    );
  }

  Widget homeworkDetailedItem() => Stack(
    children: [
      Padding(
        padding:  EdgeInsets.only(top: 8.w),
        child: Container(
          height: 28.h,
          decoration: BoxDecoration(
            color: CommonColors.inputBackgroundColor,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      Image(
        width: 10.h,
        height: 10.h,
        //fit: BoxFit.fill,
        image: AssetImage(AssetsImage.classExam),
      ),

      Padding(
        padding:  EdgeInsets.only(top: 12.w),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.w),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 5.h,

                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('اختبار عربي'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.w,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('عدد الطلاب المشاركة'),
                      SizedBox(width: 2.w,),
                      Text('35',
                        style: TextStyle(
                          color: CommonColors.studentHomeTopBar,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.w,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('تاريخ البدء'),
                      SizedBox(width: 2.w,),
                      Text('2022/3/1',
                        style: TextStyle(
                          color: CommonColors.studentHomeTopBar,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.w,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: SvgPicture.asset(
                      AssetsImage.inputBackground,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('تاريخ الانتهاء'),
                      SizedBox(width: 2.w,),
                      Text('2022/3/1',
                        style: TextStyle(
                          color: CommonColors.studentHomeTopBar,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
