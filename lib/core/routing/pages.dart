import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/pages/about/about.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/pages/about/bindings/b_about.dart';
import 'package:accurate/pages/notfound/not_found_page.dart';
import 'package:accurate/pages/dashboard/main/dashboard.dart';
import 'package:accurate/pages/dashboard/bindings/b_dashboard.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static Future<String> initPage({required bool isDev}) async {
    if (isDev) {
      return PageRoutes.dashboard;
    } else {
      return PageRoutes.exception;
    }
  }

  static final routes = [
    GetPage(
        name: PageRoutes.exception,
        curve: Curves.easeInOutQuint,
        transition: Transition.native,
        transitionDuration: Duration(
            milliseconds: AppThemes().standAnimationDuration
        ),
        page: () => const ErrorPage()
    ),
    GetPage(
        name: PageRoutes.dashboard,
        curve: Curves.easeInOutQuint,
        transition: Transition.native,
        binding: DashboardBindings(),
        transitionDuration: Duration(
            milliseconds: AppThemes().standAnimationDuration
        ),
        page: () => const Dashboard()
    ),
    GetPage(
        name: PageRoutes.account,
        curve: Curves.easeInOutQuint,
        transition: Transition.downToUp,
        binding: AboutBindings(),
        transitionDuration: Duration(
            milliseconds: AppThemes().standAnimationDuration
        ),
        page: () => const About()
    )
  ];
}