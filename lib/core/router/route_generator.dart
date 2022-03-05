import 'package:flutter/material.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section.dart';
import 'package:selaheltelmeez/features/landing/presentation_layer/landing_screen.dart';
import 'package:selaheltelmeez/widgets/web_view/web_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LandingScreen());
     case '/WebViewer':
      // Validation of correct data type
        if (args is ListItem) {
          return MaterialPageRoute(builder: (_) => WebViewer(url: args.url!,title: args.name!,)
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return MaterialPageRoute(
        builder: (_) =>  WebViewer(url: args?.toString() ?? "", title: "",)
        );
      default:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
    // If there is no such named route in the switch statement, e.g. /third
    }
  }
}