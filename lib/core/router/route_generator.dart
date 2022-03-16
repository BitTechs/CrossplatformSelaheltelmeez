import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:selaheltelmeez/features/authentication/login/view/login_screen.dart';
import 'package:selaheltelmeez/features/authentication/register/view/register_screen.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/view/validate_otp_screen.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/list_item.dart';
import 'package:selaheltelmeez/features/landing/presentation_layer/landing_screen.dart';
import 'package:selaheltelmeez/features/student/home/view/student_home_screen.dart';
import 'package:selaheltelmeez/features/student/layout/view/student_layout_screen.dart';
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
      case '/StudentLayout':
        return PageTransition(child: const StudentLayoutScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
      case '/StudentHome':
      return PageTransition(child: const StudentHomeScreen(),type: pageTransitionType,alignment: pageAlignment,reverseDuration: popDuration,duration: pushDuration);
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