import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/lesson_clips/lesson_clips_cubit.dart';
import 'package:selaheltelmeez/src/bloc/student/lesson_clips/lesson_score_cubit.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/clip_type.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/game_object_clip.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/loading/double_bounce.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_detailed_navigated_app_scaffold.dart';

class LessonScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final int lessonId;

  const LessonScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.lessonId})
      : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int selectedItem = 0;

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
          title: widget.title,
          subtitle: widget.subtitle,
          image: widget.image,
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
                      percent: 0.5,
                      isRTL: true,
                      leading: Text(
                        "${((state.studentScore / state.lessonScore) * 100).toStringAsFixed(2)} %",
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
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => itemFilterList(
                                  state.lessonsClip.types[index]),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 0.0,
                              ),
                              itemCount: state.lessonsClip.types.length,
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
                                          onTap: () {
                                            final type = state.lessonsClip
                                                .clips[index].clipType;
                                            if (type == 1) // interactive
                                            {
                                              final url = state.lessonsClip
                                                  .clips[index].gameObjectUrl;
                                              final title = state.lessonsClip
                                                  .clips[index].clipName;
                                              Navigator.of(context).pushNamed(
                                                  RouteNames
                                                      .gameObjectInteractiveViewer,
                                                  arguments: [url, title]);
                                            }
                                            if (type == 4) // youtube
                                            {
                                              final url = state.lessonsClip
                                                  .clips[index].gameObjectUrl;
                                              final title = state.lessonsClip
                                                  .clips[index].clipName;
                                              Navigator.of(context).pushNamed(
                                                  RouteNames
                                                      .gameObjectInteractiveViewer,
                                                  arguments: [url, title]);
                                            }
                                          },
                                          child: itemLessonList(
                                              state.lessonsClip.clips[index])),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                  itemCount: state.lessonsClip.clips.length),
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

  Widget itemFilterList(ClipType clipType) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScaledWidget(
          scale: (selectedItem == clipType.value) ? 1.2 : 1.0,
          opacity: (selectedItem == clipType.value) ? 1.0 : 0.6,
          onTap: () {
            setState(() {
              selectedItem == clipType.value;
            });
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

  Widget selectedItemFilterList() => Column(
        children: const [
          Image(
            height: 60,
            width: 60,
            image: AssetImage(AssetsImage.all),
          ),
          Text('فيديو'),
        ],
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
