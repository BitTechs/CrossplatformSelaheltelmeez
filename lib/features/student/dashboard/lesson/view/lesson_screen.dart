import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

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
        //appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  color: CommonColors.studentHomeTopBar,
                  height: 90.0,
                  width: double.infinity,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0,
                    right: 16.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        child: const Image(
                          image: AssetImage(AssetsImage.studentUser),
                      ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اللغة العربية',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'النص الشعري اسلمي يامصر',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            LinearPercentIndicator(
              width: (MediaQuery.of(context).size.width) -100,
              lineHeight: 8.0,
              alignment: MainAxisAlignment.center,
              percent: 0.5,
              isRTL: true,
              leading: const Text(
                "50.0%",
                style:  TextStyle(fontSize: 12.0),
              ),
              barRadius: const Radius.circular(16),
              backgroundColor: Colors.grey[300],
              progressColor: Colors.amberAccent,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              height: 110.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => selectedItem == index ? selectedItemFilterList() : itemFilterList(index),
                  separatorBuilder: (context, index) => const SizedBox(width: 30.0,),
                  itemCount: 7,
                ),
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
                    separatorBuilder: (context, index) => const SizedBox(height: 15.0,),
                    itemCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemFilterList(index) => GestureDetector(
    onTap: (){
      setState(() {
        selectedItem = index;
      });

    },
    child: Column(
      children: [
        CircleAvatar(
          radius: 24.0,
          child: Image(
            image: AssetImage(AssetsImage.facebookAuth),
          ),
        ),
        Text(
            'فيديو'
        ),
      ],
    ),
  );

  Widget selectedItemFilterList() => Column(
    children: [
      CircleAvatar(
        radius: 28.0,
        child: Image(
          image: AssetImage(AssetsImage.facebookAuth),
        ),
      ),
      Text(
          'فيديو'
      ),
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
            image: DecorationImage(
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
                children: [
                  Expanded(
                    child: Text('نشاط 1 علي الفصل الاول ',
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

              Spacer(),
              Text('الدرجة : 10',
              style: TextStyle(
                color: CommonColors.studentHomeTopBar
              ),
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
