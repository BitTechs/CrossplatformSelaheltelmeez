import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';

class LessonScreen extends StatefulWidget {
  LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int selectedItem = 0;

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
                      SizedBox(
                        width: 72.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'اللغة العربية',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'النص الشعري اسلمي يامصر',
                                style: TextStyle(
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
                      const Image(
                        width: 110,
                        height: 110,
                        image: AssetImage(AssetsImage.all),
                        //fit: BoxFit.fill,
                      ),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            LinearPercentIndicator(
              width: (MediaQuery.of(context).size.width) - 100,
              lineHeight: 8.0,
              alignment: MainAxisAlignment.center,
              percent: 0.5,
              isRTL: true,
              leading: const Text(
                "50.0%",
                style: TextStyle(fontSize: 12.0),
              ),
              barRadius: const Radius.circular(16),
              backgroundColor: Colors.grey[300],
              progressColor: Colors.amberAccent,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 110.0,
              color: Colors.white,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => itemFilterList(index),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 0.0,
                ),
                itemCount: 7,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                    //shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => itemLessonList(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                    itemCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemFilterList(index) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: ScaledWidget(
      scale: (selectedItem == index) ? 1.2 : 1.0,
      opacity: (selectedItem == index)? 1.0: 0.6,
      onTap: () {
        setState(() {
          selectedItem = index;
        });
      },
      child: Column(
            children: [
              Image.asset(
                      AssetsImage.all,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
              Text('فيديو'),
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

  Widget itemLessonList() => Container(
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: CommonColors.studentHomeTopBar,
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: AssetImage(AssetsImage.gameLand),
                  fit: BoxFit.cover,
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
                    children: const [
                      Expanded(
                        child: Text(
                          'نشاط 1 علي الفصل الاول',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //Spacer(),
                      Icon(
                        Icons.airplay,
                        size: 16,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'الدرجة : 10',
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
