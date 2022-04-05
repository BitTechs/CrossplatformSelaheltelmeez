import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';

class ParentRecentActivity extends StatelessWidget {
  const ParentRecentActivity({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
      title: "ايسل احمد محمد",
      color: CommonColors.parentColor,
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (context, index) => Container(
              height: 180,
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 1.5,
                        color: Colors.black,
                      ),
                      CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),

                  const SizedBox(
                    width: 10.0,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('16',
                        textAlign: TextAlign.center,
                      ),
                      Text('مارس',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  const SizedBox(
                    width: 5.0,
                  ),

                  Expanded(
                    child: Container(
                      height: 160,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 2,
                              color: Colors.green,
                            ),

                            const SizedBox(width: 8.0,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('اللغة العربية',
                                    style: TextStyle(
                                        fontSize: 14.0
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('المحور 1 اكتشف ذاتي الموضوع 1 وطني',
                                    style: TextStyle(
                                        fontSize: 14.0
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('اختبر معلوماتك',
                                    style: TextStyle(
                                        fontSize: 14.0
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text('نص استماع مجدي يعقوب',
                                    style: TextStyle(
                                        fontSize: 14.0
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 8.0,),

                            Image(
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.fill,
                              image: AssetImage(AssetsImage.parentUser),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 0.0,),
            itemCount: 10),
      ),
    );
  }
}
