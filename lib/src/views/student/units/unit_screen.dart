import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/units/subject_score_cubit.dart';
import 'package:selaheltelmeez/src/bloc/student/units/unit_cubit.dart';
import 'package:selaheltelmeez/src/data/student/dtos/unit/curriculum_unit.dart';
import 'package:selaheltelmeez/src/data/student/dtos/unit/unit_lesson.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';
import 'package:selaheltelmeez/widgets/loading/double_bounce.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class UnitScreen extends StatelessWidget {
  final String curriculumId;
  final String backgroundImage;
  final String iconImage;
  final String curriculumName;

  const UnitScreen(
      {Key? key,
      required this.curriculumId,
      required this.backgroundImage,
      required this.curriculumName,
      required this.iconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UnitCubit(context.read<CurriculumRepository>())
              ..loadUnitsByCurriculumId(curriculumId)),
        BlocProvider(
            create: (context) =>
                SubjectScoreCubit(context.read<CurriculumRepository>())
                  ..loadStudentSubjectScore(curriculumId))
      ],
      child: FancyNavigatedAppScaffold(
        title: curriculumName,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(backgroundImage),
                        height: 30.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: BlocConsumer<SubjectScoreCubit, SubjectScoreState>(
                        listener: (context, state) {
                          if (state is SubjectScoreFailed) {
                            final snackBar = SnackBar(
                              content: Text(state.errorMessage),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        builder: (context, state) {
                          if (state is SubjectScoreLoading) {
                            return const DoubleBounce();
                          } else if (state is SubjectScoreSuccess) {
                            return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.grey[100],
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '?????????? ??????????????',
                                          style: TextStyle(
                                              color: CommonColors
                                                  .studentHomeTopBar),
                                        ),
                                        Text(
                                          '${state.studentScore}/${state.subjectScore}',
                                          style: TextStyle(
                                              color: CommonColors
                                                  .studentHomeTopBar),
                                        ),
                                      ],
                                    )));
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                BlocConsumer<UnitCubit, UnitState>(
                  listener: (context, state) {
                    if (state is UnitFailed) {
                      final snackBar = SnackBar(
                        content: Text(state.errorMessage),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state is UnitSuccess) {
                      return Container(
                        color: Colors.white,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              itemLesson(state.units[index], context),
                          separatorBuilder: (context, index) => Container(
                            color: Colors.grey[300],
                          ),
                          itemCount: state.units.length,
                        ),
                      );
                    }
                    if (state is UnitLoading) {
                      return const DoubleBounce();
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemLesson(CurriculumUnit item, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Text(
            item.name,
            style: TextStyle(
              fontSize: 20.0,
              color: CommonColors.studentHomeTopBar,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: CommonColors.inputBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      lessonsItem(item.lessons[index], context),
                  // separatorBuilder: (context, index) => Container(
                  //   color: Colors.grey[300],
                  //   height: 1.0,
                  // ),
                  itemCount: item.lessons.length,
                ),
              ),
            ),
          ),
        ],
      );

  Widget lessonsItem(UnitLesson item, context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(RouteNames.studentLesson,
              arguments: [curriculumName, item.name, iconImage, item.id , curriculumId]);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              '- ${item.name}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );
}
