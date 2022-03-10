import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/student/home/business_logic_layer/student_home_provider_container.dart';
import 'package:selaheltelmeez/features/student/home/business_logic_layer/subject_state_provider.dart';
import 'package:selaheltelmeez/features/student/home/business_logic_layer/subject_status_cubit.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/recent_lesson/recent_lesson_commit_result.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/subject/subject_i_enumerable_commit_result.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StudentHomeScreen extends ConsumerWidget {
  const StudentHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<RecentLessonCommitResult> recentLessonsResult =
        ref.watch(StudentHomeProviderContainer.futureGetRecentLessonsProvider);
    return FlatAppScaffold(
        child: ScrollColumnExpandable(
      crossAxisAlignment: CrossAxisAlignment.start,
      headerWidgets: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 85.0,
                color: CommonColors.studentHomeTopBar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                      top: 40.0,
                    ),
                    child: Wrap(
                      spacing: 0,
                      children: [
                        const Image(
                          image: AssetImage(AssetsImage.studentPrize),
                          height: 65,
                          width: 65,
                        ),
                        PhysicalModel(
                          elevation: 0,
                          color: CommonColors.studentHomeTopBar,
                          shadowColor: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Text(
                                  'Ahmed Abuelnour',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  'الصف السادس الابتدائي',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage(AssetsImage.studentPrize),
                          height: 45,
                          width: 45,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        SizedBox(
                          width: 90.0,
                          height: 40.0,
                          child: FancyElevatedButton(
                            title: 'خروج',
                            backGroundColor:
                                CommonColors.fancyElevatedButtonBackGroundColor,
                            titleColor: CommonColors.fancyElevatedTitleColor,
                            shadowColor:
                                CommonColors.fancyElevatedShadowTitleColor,
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
      centeredExpandedWidgets: Column(
        children: [
          recentLessonsResult.when(
            loading: () => const Center(child: DoubleBounce()),
            error: (err, stack) => Text('Error: $err'),
            data: (result) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "دروسي الأخيرة",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const Image(
                        image: AssetImage(AssetsImage.studentPrize),
                        height: 35,
                        width: 35,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: (result.value?.recentLessons.length ?? 0) * 60.0,
                    child: ListView.builder(
                        itemCount: result.value?.recentLessons.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      result.value?.recentLessons[index]
                                              .lessonName ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      '${result.value?.recentLessons[index].progress} %',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                LinearPercentIndicator(
                                  animation: true,
                                  lineHeight: 20.0,
                                  animationDuration: 2000,
                                  percent: (result.value?.recentLessons[index]
                                              .progress ??
                                          0) *
                                      0.01,
                                  barRadius: const Radius.circular(16),
                                  progressColor: Colors.greenAccent,
                                ),
                              ],
                            )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  FancyElevatedButton(
                      title: 'أشترك الآن',
                      backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                      titleColor: CommonColors.fancyElevatedTitleColor,
                      shadowColor: CommonColors.fancyElevatedShadowTitleColor)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المواد الدراسية",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Expanded(
                child: FancyDropDownFormField<String>(
                  width: MediaQuery.of(context).size.width - 170,
                  hintTitle: 'اختر الفصل الدراسي',
                  items: const [
                    'الفصل الدراسي الاول',
                    'الفصل الدراسي الثاني'
                  ],
                  itemBuilder: (context, item) => Text(
                    item,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 14),
                  ),
                  onChanged: (value)=> context.read<SubjectStatusCubit>().getSubjectsAsync(value!),
                ),
              ),
            ],
          ),
          BlocBuilder<SubjectStatusCubit, SubjectStatusState>(
              builder: (context, state) {
            if (state is SubjectStatusLoading) {
              return const Center(child: DoubleBounce());
            }
            if (state is SubjectStatusError) {
              Text('Error: ${state.errorMessage}');
            }
            if (state is SubjectStatusLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: ((state.subjects.length / 2).round() * 190),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.subjects.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.grey[100],
                            child: ImageWithFloatingBottomHeader(
                              image: state.subjects[index].iconOfSlider ?? "",
                              header: state.subjects[index].subjectName ?? "",
                              headerColor: Colors.black,
                              headerBackgroundColor: Colors.white,
                              alignment: Alignment.bottomCenter,
                              isNetworkImage: true,
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12.0,
                                crossAxisSpacing: 12.0),
                      ),
                    )
                  ],
                ),
              );
            }
            else {
              return const SizedBox();
            }
          }),
        ],
      ),
      footerWidgets: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "قريبا Joy School",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Image(image: AssetImage(AssetsImage.joySchool)),
          )
        ],
      ),
    ));
  }
}
