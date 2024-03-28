import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/routing/pages.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/core/controllers/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var mainController = Get.put(AppMainController());
  await AppPages.initPage(isDev: true).then((String toRoute) {
    runApp(
        GetMaterialApp(
          theme: ThemeData(
            primaryColor: AppColors.themeRed,
          ),
      debugShowCheckedModeBanner: false,
      title: "Accurate User Endpoints",
      initialRoute: toRoute,
      getPages: AppPages.routes,
    ));
  });
}
