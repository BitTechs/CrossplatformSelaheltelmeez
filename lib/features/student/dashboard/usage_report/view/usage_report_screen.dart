import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:table_calendar/table_calendar.dart';


class UsageReportScreen extends StatelessWidget {
  const UsageReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تقارير الاستخدام',
        style: AppTheme.screenTitle,
        ),
        backgroundColor: CommonColors.studentHomeTopBar,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

          TableCalendar(
            daysOfWeekHeight: 40.0,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
            locale: 'ar_EG',
      ),

              const SizedBox(height: 40.0,),

              Stack(
              children: [
                SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              AssetsImage.inputBackground,
              color: CommonColors.inputBackgroundColor,
              fit: BoxFit.fill,
            ),
          ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(AssetsImage.calender),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'جدول الاستخدام',
                    ),
                  ],
                ),
            ],
          ),

              const SizedBox(height: 24.0),

              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/RecentActivity');
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        AssetsImage.inputBackground,
                        color: CommonColors.inputBackgroundColor,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(AssetsImage.clock),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'الانشطة الاخيرة',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24.0),

              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/detailed_subject_report');
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        AssetsImage.inputBackground,
                        color: CommonColors.inputBackgroundColor,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(AssetsImage.paperTxt),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            'تقرير تفصيلي عن مستوي تقدمي في موادي',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24.0),

              InkWell(
                onTap: () {
                    Navigator.of(context).pushNamed('/detailed_lesson_report');
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        AssetsImage.inputBackground,
                        color: CommonColors.inputBackgroundColor,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(AssetsImage.paper),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Text(
                            'تقرير تفصيلي عن مستوي تقدمي في دروسي',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),



]
              ),
        ),
      ),
    );
  }
}
