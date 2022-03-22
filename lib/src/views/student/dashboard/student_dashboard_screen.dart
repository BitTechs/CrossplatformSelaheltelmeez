import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/dashboard/curriculum_cubit.dart';
import 'package:selaheltelmeez/src/data/student/entity/term_entity.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:sizer/sizer.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (_) =>  CurriculumCubit(context.read<CurriculumRepository>()),
    child: FlatAppScaffold(
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Image(
                            image: NetworkImage(
                                AppUserLocalStorageProvider.sharedAppUserEntity?.avatarUrl ?? "Url"),
                            height: 70,
                            width: 70,
                          ),
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
                                  AppUserLocalStorageProvider.sharedAppUserEntity?.fullName ?? "Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  AppUserLocalStorageProvider.sharedAppUserEntity?.grade ?? "Grade",
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
      centeredExpandedWidgets: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* recentLessonsResult.when(
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
            ),*/
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(RouteNames.usageReport);
                  },
                  child: Image.asset(AssetsImage.statistics,
                  ),
                ),
              ],
            ),
            Text(
              "المواد الدراسية",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Builder(
              builder: (context) {
                return FancyDropDownFormField<TermEntity>(
                  name: 'term',
                  hintTitle: 'اختر الفصل الدراسي',
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
                  onChanged: (value) => context
                      .read<CurriculumCubit>()
                      .getSubjectsAsync(value?.id),
                );
              }
            ),
            BlocBuilder<CurriculumCubit, CurriculumState>(
                builder: (context, state) {
              if (state is CurriculumLoading) {
                return Center(
                    child: SizedBox(
                        height: 50.w,
                        child: const DoubleBounce()));
              }
              if (state is CurriculumError) {
                Text('Error: ${state.errorMessage}');
              }
              if (state is CurriculumLoaded) {
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
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(RouteNames.studentSubject);
                              },
                              child: Card(
                                color: Colors.grey[100],
                                child: ImageWithFloatingBottomHeader(
                                  image:
                                      state.subjects[index].backgroundImage ?? "",
                                  header: state.subjects[index].name ?? "",
                                  headerColor: Colors.black,
                                  headerBackgroundColor: Colors.white,
                                  alignment: Alignment.bottomCenter,
                                  isNetworkImage: true,
                                ),
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
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
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
    )),
);
  }
}
