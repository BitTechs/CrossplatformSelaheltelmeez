import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

import '../model/list_item_model.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List<ListItem> items = [
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
      ListItem(title: 'Tile 1', lessons: ['lesson 1', 'lesson 2', 'lesson 3']),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
            'اللغة العربية',
          style: AppTheme.screenTitle,
          textAlign: TextAlign.center,
        ),
        backgroundColor: CommonColors.studentHomeTopBar,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image(
                      image: AssetImage(AssetsImage.gameLand),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'مجموع الدرجات',
                            style: TextStyle(
                              color: CommonColors.studentHomeTopBar
                            ),
                          ),
                          Text(
                            '7.5/2570',
                            style: TextStyle(
                                color: CommonColors.studentHomeTopBar
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ItemLesson(items[index],context),
                  separatorBuilder: (context, index) => Container(
                    color: Colors.grey[300],
                    //height: 1.0,
                  ),
                  itemCount: items.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget ItemLesson(ListItem item, context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 10.0,
      ),
      Text('${item.title}',
        style: TextStyle(
            fontSize: 20.0,
          color: CommonColors.studentHomeTopBar,
        ),),
      const SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0
        ),
        child: Container(
          decoration: BoxDecoration(
            color: CommonColors.inputBackgroundColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => lessonsItem(item.lessons[index], context),
              // separatorBuilder: (context, index) => Container(
              //   color: Colors.grey[300],
              //   height: 1.0,
              // ),
              itemCount: item.lessons.length,
            ),
          ),
        ),
      ),

    ],
  );

  Widget lessonsItem(String item,context) => GestureDetector(
    onTap: () {
    Navigator.of(context).pushNamed("/StudentLesson");
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text('- $item',
          style: TextStyle(
              fontSize: 16.0
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );

}
