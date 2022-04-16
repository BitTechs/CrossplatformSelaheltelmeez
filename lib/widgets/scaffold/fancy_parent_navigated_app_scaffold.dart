import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:sizer/sizer.dart';

class FancyParentNavigatedAppScaffold extends StatelessWidget {
  final Widget child;
  final String parentName;
  final String childName;
  final String childGrade;
  final String parentImage;
  final String childImage;
  final bool isLocalImage;
  final Color? color;
  final VoidCallback? onPressed;

  const FancyParentNavigatedAppScaffold(
      {Key? key,
      required this.parentName,
      required this.childName,
      required this.childGrade,
      required this.parentImage,
      required this.childImage,
      required this.isLocalImage,
      this.onPressed,
      this.color,
        required this.child,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 16.h,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
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
          flexibleSpace: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Stack(
                children: [
                  Container(
                    color: CommonColors.parentColor,
                    height: 9.h,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 8.h, top: 2.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: isLocalImage? Image(
                            image: AssetImage(parentImage),
                            height: 20.w,
                            width: 20.w,
                          ) : Image(
                            image: NetworkImage(parentImage),
                            height: 20.w,
                            width: 20.w,
                          ),

                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 9.w),
                            child: Text(
                              parentName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       SizedBox(width: 22.w,),
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Padding(
                            padding:  EdgeInsetsDirectional.only(start: 10.w),
                            child: Container(
                              height: 7.h,
                              width: 56.w,
                              decoration: BoxDecoration(
                                color: CommonColors.parentColor,
                                borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(4.h)),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.w),
                                child: isLocalImage? Image(
                                  image: AssetImage(childImage),
                                  height: 16.w,
                                  width: 16.w,
                                ) : Image(
                                  image: NetworkImage(childImage),
                                  height: 16.w,
                                  width: 16.w,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    childName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    childGrade,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 1.w),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 4.w,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 4.w),
                        child: GestureDetector(
                          onTap: onPressed,
                          child: Image(
                            image: AssetImage(AssetsImage.statistics),
                            height: 6.h,
                            width: 6.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: child,
      ),
    );
  }
}
