import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyDetailedNavigatedAppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;
  final String image;
  final bool isLocalImage;

  const FancyDetailedNavigatedAppScaffold(
      {Key? key,
      required this.child,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.isLocalImage})
      : super(key: key);

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
            toolbarHeight: 110,
            //centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Stack(
              children: [
                Container(
                  color: CommonColors.studentHomeTopBar,
                  height: 80.0,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 72.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  subtitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        if(isLocalImage)...[
                          Image(
                            width: 110,
                            height: 110,
                            image: AssetImage(image),
                            //fit: BoxFit.fill,
                          ),
                        ]else...[
                          Image(
                            width: 110,
                            height: 110,
                            image: NetworkImage(image),
                            //fit: BoxFit.fill,
                          ),
                        ],
                        const SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: child),
    );
  }
}
