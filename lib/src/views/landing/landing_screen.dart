import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/language_change_provider.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:sizer/sizer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    padding:  EdgeInsetsDirectional.only(
                      end: 4.w,
                      top: 4.w,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 25.w,
                        height: 10.w,
                        child: FancyElevatedButton(
                          title: S.of(context).login_btn,
                          backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                          titleColor: CommonColors.fancyElevatedTitleColor,
                          shadowColor: CommonColors
                              .fancyElevatedShadowTitleColor,
                          onPressed: () => Navigator.of(context).pushNamed('/login'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 4.w,
                      top: 4.w,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 25.w,
                        height: 10.w,
                        child: FancyElevatedButton(
                          title: '????????',
                          backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                          titleColor: CommonColors.fancyElevatedTitleColor,
                          shadowColor: CommonColors
                              .fancyElevatedShadowTitleColor,
                          onPressed: () => context.read<LanguageChangeProvider>().changeLocale(),
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
          centeredExpandedWidgets:const Center(child: DoubleBounce()), /*result.when(
            loading: () => const Center(child: DoubleBounce()),
            error: (err, stack) => Text('Error: $err'),
            data: (result) =>
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "???????? ?????? ?????????? ?????????????? ???????????? ???????? ?????????? ??????????????",
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
                        "???????? ?????? ?????????????? ?????????????? ???????? ??????????????",
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
          ),*/
          footerWidgets: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  "?????????? Joy School",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2?.copyWith(
                    fontSize: 11.sp,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Image(image: AssetImage(AssetsImage.joySchool)),
              )
            ],
          ),
        ));
  }
}
