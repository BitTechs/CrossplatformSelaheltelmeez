import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/src/data/landing/dtos/list_item.dart';
import 'package:selaheltelmeez/src/views/landing/landing_screen.dart';
import 'package:selaheltelmeez/src/views/student/achievements/achievements_screen.dart';
import 'package:selaheltelmeez/src/views/student/detailed_lesson_report/detailed_lesson_report_screen.dart';
import 'package:selaheltelmeez/src/views/student/detailed_subject_report/detailed_subject_report_screen.dart';
import 'package:selaheltelmeez/src/views/student/lesson/lesson_screen.dart';
import 'package:selaheltelmeez/src/views/student/recent_activity/recent_activity_screen.dart';
import 'package:selaheltelmeez/src/views/student/student_navigation_bar/student%20_navigation_bar_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/change_email_or_mobile/change_email_or_mobile_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/forget_password/forget_password_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/forget_password/reset_password_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/forget_password/validate_forget_password_otp_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/login/login_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/register/register_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/update_profile/update_profile_screen.dart';
import 'package:selaheltelmeez/src/views/authentication/validate_otp/validate_otp_screen.dart';
import 'package:selaheltelmeez/src/views/student/classes/class_search_screen.dart';
import 'package:selaheltelmeez/src/views/student/units/unit_screen.dart';
import 'package:selaheltelmeez/src/views/student/usage_report/usage_report_screen.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class RouteGenerator {

  static PageTransitionType pageTransitionType = PageTransitionType.rightToLeft;
  static Alignment pageAlignment = Alignment.bottomCenter;
  static  Duration pushDuration = const Duration(milliseconds: 300);
  static Duration popDuration = const Duration(milliseconds: 300);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.index:
        return PageTransition(child: const LandingScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.login:
        return PageTransition(child: const LoginScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.register:
        return PageTransition(child:  RegisterScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.updateProfile:
        return PageTransition(child:  UpdateProfileScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.validateOTP:
        return PageTransition(child:  ValidateOTPScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.changeEmailOrMobile:
        return PageTransition(child: const ChangeEmailOrMobileScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.forgetPassword:
        return PageTransition(child: const ForgetPasswordScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.validateForgetPassword:
        return PageTransition(child:  ValidateForgetPasswordOTPScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.resetPassword:
        String identityId = (args as String);
        return PageTransition(child:  ResetPasswordScreen(identityUserId: identityId),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentHomeLayout:
        return PageTransition(child: const StudentNavBarScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentSubject:
        List<dynamic> dynamicArgs = (args as List<dynamic>);
        return PageTransition(child: UnitScreen(curriculumId: dynamicArgs[0], backgroundImage: dynamicArgs[1], curriculumName: dynamicArgs[2],),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentLesson:
        return PageTransition(child: LessonScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.classSearch:
        return PageTransition(child: ClassSearchScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.usageReport:
        return PageTransition(child: const UsageReportScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.recentActivity:
        return PageTransition(child: const RecentActivityScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.detailedSubjectReport:
        return PageTransition(child: const DetailedSubjectReportScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.detailedLessonReport:
        return PageTransition(child: const DetailedLessonReportScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.studentAchievements:
        return PageTransition(child: const AchievementsScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      // Validation of correct data type
      case RouteNames.webViewer:
        ListItem listItem = (args as ListItem);
          return PageTransition(child:  WebViewer(url: listItem.url!,title: listItem.name!,),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case RouteNames.youTubeViewer:
      // Validation of correct data type
        ListItem listItem = (args as ListItem);
        return PageTransition(child: YouTubeViewer(videoCode: listItem.url!),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      default:
        return PageTransition(child: const LandingScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
    // If there is no such named route in the switch statement, e.g. /third
    }
  }
}