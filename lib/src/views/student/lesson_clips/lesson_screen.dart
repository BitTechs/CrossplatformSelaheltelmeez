import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/lesson_clips/lesson_clips_cubit.dart';
import 'package:selaheltelmeez/src/bloc/student/lesson_clips/lesson_score_cubit.dart';
import 'package:selaheltelmeez/src/data/student/arguments/game_object_argument.dart';
import 'package:selaheltelmeez/src/data/student/dtos/game_object_activity/activity_request.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/clip_type.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/game_object_clip.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';
import 'package:selaheltelmeez/src/data/student/repositories/game_object_activity/game_object_activity_repository.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/loading/double_bounce.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_detailed_navigated_app_scaffold.dart';

class LessonScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int lessonId;
  final String subjectId;
  const LessonScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.lessonId, required this.subjectId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                LessonClipsCubit(context.read<CurriculumRepository>())
                  ..getLessonClipsAsync(10)),
        BlocProvider(
            create: (context) =>
                LessonScoreCubit(context.read<CurriculumRepository>())
                  ..loadStudentLessonScore(10)),
      ],
      child: FancyDetailedNavigatedAppScaffold(
          title: title,
          subtitle: subtitle,
          image: image,
          isLocalImage: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              BlocBuilder<LessonScoreCubit, LessonScoreState>(
                builder: (context, state) {
                  if(state is LessonScoreSuccess){
                    return LinearPercentIndicator(
                      width: (MediaQuery.of(context).size.width) - 100,
                      lineHeight: 8.0,
                      alignment: MainAxisAlignment.center,
                      percent: (state.studentScore / state.lessonScore),
                      isRTL: true,
                      leading: Text(
                        " %",
                        style: const TextStyle(fontSize: 12.0),
                      ),
                      barRadius: const Radius.circular(16),
                      backgroundColor: Colors.grey[300],
                      progressColor: Colors.amberAccent,
                    );
                  }else{
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: BlocConsumer<LessonClipsCubit, LessonClipsState>(
                  listener: (context, state) {
                    if (state is LessonClipsFailed) {
                      final snackBar = SnackBar(
                        content: Text(state.errorMessage),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state is LessonClipsLoading) {
                      return const DoubleBounce();
                    }
                    if (state is LessonClipsSuccess) {
                      return Column(
                        children: [
                          Container(
                            height: 110.0,
                            color: Colors.white,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => itemFilterList(context,state.types[index]),
                              itemCount: state.types.length,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ListView.separated(
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                          onTap: () async {
                                            final type = state.clips[index].clipType;
                                            if (type == 1) // interactive
                                            {
                                              if(state.clips[index].activityId == null)
                                              {
                                                final ValueCommitResult<int> newActivityId = await context.read<GameObjectActivityRepository>()
                                                    .insertActivityAsync(
                                                    ActivityRequest(clipId: state.clips[index].id,
                                                                    lessonId: state.clips[index].lessonId,
                                                                    subjectId: subjectId));

                                                state.clips[index].activityId = newActivityId.value!;
                                              }
                                              GameObjectArgument gameObjectArgument =
                                              GameObjectArgument(url: state.clips[index].gameObjectUrl,
                                                  clipScore : state.clips[index].clipScore,
                                                  orientation: state.clips[index].orientation,
                                                  lessonId: state.clips[index].lessonId,
                                                  clipId: state.clips[index].id,
                                                  activityId: state.clips[index].activityId!,
                                                  code: state.clips[index].gameObjectCode ?? 0,
                                                  progress: state.clips[index].gameObjectProgress ?? 0,);
                                                  Navigator.of(context).pushNamed(RouteNames.gameObjectInteractiveViewer,arguments: gameObjectArgument);
                                            }
                                            if (type == 4) // youtube
                                            {
                                              final url = state.clips[index].gameObjectUrl;
                                              final title = state.clips[index].clipName;

                                            //  Navigator.of(context).pushNamed(RouteNames.gameObjectInteractiveViewer,arguments: [url, title]);
                                            }
                                          },
                                          child: itemLessonList(state.clips[index])),separatorBuilder: (context, index) =>
                                          const SizedBox(height: 15.0,),
                                           itemCount: state.clips.length),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          )),
    );
  }

  Widget itemFilterList(BuildContext context, ClipType clipType) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScaledWidget(
          scale: (context.read<LessonClipsCubit>().selectedClipType == clipType.value) ? 1.2 : 1.0,
          opacity: (context.read<LessonClipsCubit>().selectedClipType == clipType.value) ? 1.0 : 0.6,
          onTap: () {
            context.read<LessonClipsCubit>().applyFilter(clipType.value!);
          },
          child: Column(
            children: [
              Image.network(
                clipType.imageUrl!,
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
              Text(clipType.name!),
            ],
          ),
        ),
      );

  Widget itemLessonList(GameObjectClip gameObjectClip) => SizedBox(
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: CommonColors.studentHomeTopBar,
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage(gameObjectClip.thumbnail),
                  fit: BoxFit.fill,
                ),
              ),
              height: 90.0,
              width: 120.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          gameObjectClip.clipName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //Spacer(),
                      const Icon(
                        Icons.airplay,
                        size: 16,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'الدرجة : ${gameObjectClip.clipScore}',
                    style: TextStyle(color: CommonColors.studentHomeTopBar),
                  ),
                  Container(
                    color: Colors.grey[300],
                    height: 2.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
