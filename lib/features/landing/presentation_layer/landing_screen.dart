import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/landing/business_logic_layer/landing_provider_container.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section_commit_result.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<LandingSectionCommitResult> result =
    ref.watch(LandingProviderContainer.futureLandingProvider);
    return FlatAppScaffold(
        child: ScrollColumnExpandable(
          crossAxisAlignment: CrossAxisAlignment.start,
          headerWidgets: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const Image(image: AssetImage(AssetsImage.landing)),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 32.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 95.0,
                        height: 40.0,
                        child: FancyElevatedButton(
                          title: 'دخول',
                          backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                          titleColor: CommonColors.fancyElevatedTitleColor,
                          shadowColor: CommonColors
                              .fancyElevatedShadowTitleColor,
                          onPressed: () => Navigator.of(context).pushNamed('/login'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
          centeredExpandedWidgets: result.when(
            loading: () => const Center(child: DoubleBounce()),
            error: (err, stack) => Text('Error: $err'),
            data: (result) =>
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "تعرف على منهجك الدراسي بطريقة سهلة وأكثر تفاعلية",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 180.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: result.value?.listSection[0].listItem.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                child: InkWell(
                                  onTap: () =>
                                      Navigator.of(context).pushNamed(
                                          "/YouTubeViewer",
                                          arguments:
                                          result.value?.listSection[0].listItem[index]),
                                  child: Image(
                                    image: NetworkImage(
                                        result.value?.listSection[0].listItem[index].thumbnail ??
                                            ""),
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "تعرف على مايقدمه التطبيق وأهم مميزاته",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText2,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 95.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: result.value?.listSection[1].listItem
                              .length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () =>
                                      Navigator.of(context).pushNamed(
                                        "/WebViewer",
                                        arguments:
                                        result.value?.listSection[1]
                                            .listItem[index],),
                                  child: Image(
                                    image: NetworkImage(
                                        result.value?.listSection[1]
                                            .listItem[index].thumbnail ??
                                            ""),
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ),
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2,
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
