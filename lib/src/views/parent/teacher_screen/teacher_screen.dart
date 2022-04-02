import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         body: Column(
           children: [
             Stack(
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
                           child: Text("اسامة محمد",
                             style: Theme.of(context)
                                 .textTheme
                                 .bodyLarge
                                 ?.copyWith(color: Colors.white),
                           ),
                         ),
                       ),

                     ],
                   ),
                 ),
               ],

             ),
             SizedBox(height: 4.h,),
             Expanded(
               child: Padding(
                 padding:  EdgeInsets.all(4.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       "المواد الدراسية",
                       style: Theme.of(context).textTheme.subtitle1,
                     ),
                     SizedBox(height: 4.w,),
                     Container(
                       height: 35.w,
                       child: ListView.separated(
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) => subjectItemList(),
                         separatorBuilder: (context, index) => SizedBox(width: 4.w,),
                         itemCount: 7,
                       ),
                     ),

                     SizedBox(height: 4.w,),
                     Text(
                       "الفصول",
                       style: Theme.of(context).textTheme.subtitle1,
                     ),
                     SizedBox(height: 4.w,),
                     Stack(
                       alignment: AlignmentDirectional.center,
                       children: [
                         SizedBox(
                           height: 7.h,
                           width: 40.w,
                           child: SvgPicture.asset(
                             AssetsImage.inputBackground,
                             color: CommonColors.inputBackgroundColor,
                             fit: BoxFit.fill,
                           ),
                         ),
                         Text('99 فصل',
                           style: TextStyle(
                             fontSize: 15.sp,
                             fontWeight: FontWeight.bold,
                             color: CommonColors.studentHomeTopBar
                           ),
                         ),
                       ],
                     ),

                     SizedBox(height: 4.w,),
                     Text(
                       "الفصول المشترك فيها",
                       style: Theme.of(context).textTheme.subtitle1,
                     ),
                     SizedBox(height: 4.w,),
                     Container(
                       height: 12.h,
                       child: ListView.separated(
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) => InkWell(
                           onTap: () {},
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               border: Border.all(color: Colors.grey,),
                             ),
                             child:  Padding(
                               padding:  EdgeInsets.symmetric(horizontal: 4.w),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Text('اسم الفصل',),
                                   Text('اللغة العربية',),
                                   Text('اسامة',),
                                 ],
                               ),
                             ),
                           ),
                         ),
                         separatorBuilder: (context, index) => SizedBox(width: 2.w,),
                         itemCount: 10,
                       ),
                     ),
                      const Spacer(),
                      InkWell(
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
                           Text('تواصل مع المدرس'),
                         ],
                       ),
                     ],
                   ),
                 ),
                   ],
                 ),
               ),
             ),

           ],
         ),
        ),
    );
  }
  Widget subjectItemList() => Column(
    children:  [
      Image(
        height: 25.w,
        width: 25.w,
        image: AssetImage(AssetsImage.all),
      ),
      Text('اللغة العربية'),
    ],
  );
}
