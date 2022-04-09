import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/objectbox.g.dart';
import 'package:selaheltelmeez/src/data/student/entity/term_entity.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_add_button.dart';
import 'package:selaheltelmeez/widgets/inputs/fancy_dropown_form_field.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_detailed_navigated_app_scaffold.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_image_navigated_app_scaffold.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class TeacherSubjectsScreen extends StatelessWidget {
  const TeacherSubjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyImageNavigatedAppScaffold(
        title: "المواد الدراسية",
        image: AssetsImage.subjectCircle,
        isLocalImage: true,
        color: CommonColors.teacherColor,
        child: Padding(
          padding:  EdgeInsets.all(4.w),
          child: Column(
            children: [
              FancyAddButton(
                width: 40.w,
                  title: 'اضافة مواد',
                onPressed: (){
                  Navigator.of(context).pushNamed(RouteNames.teacherAddSubject);
                },
              ),
              SizedBox(height: 4.w,),
              FancyDropDownFormField<TermEntity>(
          height: 7.h,
          name: 'term',
          hintTitle: 'الفصل الدراسي',
          items: [
            TermEntity(id: 1, name: 'الفصل الدراسي الاول'),
            TermEntity(id: 2, name: 'الفصل الدراسي الثاني')
          ],
          itemBuilder: (context, item) => Text(
            item.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 14),
          ),
          onChanged: (T) {},
      ),
              SizedBox(height: 4.w,),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.w,
                  crossAxisSpacing: 4.w,
                  children: List.generate(
                    6, (index) => InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteNames.teacherSubjectScreen);
                    },
                      child: subjectItemList(index)),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget subjectItemList(int index)
  {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 6.w),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CommonColors.inputBackgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(AssetsImage.subjects),
                  width: 30.w,
                  height: 30.w,
                ),
                SizedBox(height: 4.w,),
                Text('اللغة العربية'),
              ],
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          width: 12.w,
          height: 18.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.w)
          ),
          child: Text('${index+1}',
            style: TextStyle(
              fontSize: 32.sp,
              color: CommonColors.teacherColor,
            ),
          ),
        ),
      ],
    );
  }
}
