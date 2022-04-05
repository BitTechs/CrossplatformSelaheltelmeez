import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/scaffold/fancy_navigated_app_scaffold.dart';

class ParentDetailedSubjectReport extends StatelessWidget {
  const ParentDetailedSubjectReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyNavigatedAppScaffold(
        title: "ايسل احمد محمد",
        color: CommonColors.parentColor,
        child: Container(
          width: double.infinity,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'مستوي تقدمي في المواد',
                    style: TextStyle(
                      color: CommonColors.studentHomeTopBar,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      children: List.generate(
                        16,
                            (index) => Container(
                          decoration: BoxDecoration(
                            color: CommonColors.inputBackgroundColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 10.0,
                                percent: 0.25,
                                center:  Text('25%',
                                  style:TextStyle(
                                    fontSize: 18.0,
                                  )
                                  ,),
                                progressColor: Colors.green,
                                backgroundColor: Colors.white,
                              ),
                              const SizedBox(height: 8.0,),
                              Text('اللغة العربية'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
