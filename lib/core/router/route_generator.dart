import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/view/change_email_or_mobile_screen.dart';
import 'package:selaheltelmeez/features/authentication/login/view/login_screen.dart';
import 'package:selaheltelmeez/features/authentication/register/view/register_screen.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/view/validate_otp_screen.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/list_item.dart';
import 'package:selaheltelmeez/features/landing/presentation_layer/landing_screen.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/view/student_dashboard_screen.dart';
import 'package:selaheltelmeez/features/student/dashboard/lesson/view/lesson_screen.dart';
import 'package:selaheltelmeez/features/student/dashboard/subject/view/subject_screen.dart';
import 'package:selaheltelmeez/features/student/student_navigation_bar/view/student%20_navigation_bar_screen.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class RouteGenerator {

  static PageTransitionType pageTransitionType = PageTransitionType.scale;
  static Alignment pageAlignment = Alignment.bottomCenter;
  static  Duration pushDuration = const Duration(milliseconds: 1000);
  static Duration popDuration = const Duration(milliseconds: 1000);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageTransition(child: const LandingScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/login':
        return PageTransition(child: const LoginScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/register':
        return PageTransition(child: const RegisterScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/validate_otp':
        return PageTransition(child: const ValidateOTPScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/change_email_or_mobile':
        return PageTransition(child: const ChangeEmailOrMobileScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/StudentDashboard':
        return PageTransition(child: const StudentNavBarScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/StudentSubject':
        return PageTransition(child: const SubjectScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/StudentLesson':
        return PageTransition(child: LessonScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
        case '/StudentHome':
      return PageTransition(child: const StudentDashboardScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      // Validation of correct data type
      case '/WebViewer':
        ListItem listItem = (args as ListItem);
          return PageTransition(child:  WebViewer(url: listItem.url!,title: listItem.name!,),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/YouTubeViewer':
      // Validation of correct data type
        ListItem listItem = (args as ListItem);
        return PageTransition(child: YouTubeViewer(videoCode: listItem.url!),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      default:
        return PageTransition(child: const LandingScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
    // If there is no such named route in the switch statement, e.g. /third
    }
  }
}