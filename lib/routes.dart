
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'hello_screen.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return navigate(const HelloScreen());

        }
      default:
        {
          return navigate(
            Scaffold(
              body: Center(
                child: Text(
                  "Mavjud Emas",
                  style: TextStyle(fontSize: 30.sp),
                ),
              ),
            ),
          );
        }
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String helloScreen = "/";
  static const String animation1 = "/one_route";
  static const String animation2 = "/two_route";
  static const String animation3 = "/three_route";
  static const String animation4 = "/four_route";
  static const String animation5 = "/five_route";
  static const String animation6 = "/six_route";
  static const String animation7 = "/seven_route";

}
