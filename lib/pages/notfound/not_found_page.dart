import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/routing/pages.dart';
import 'package:accurate/core/constants/themes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizing().extraSpacing
                ),
                child: const Text("404",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizing().extraSpacing
                ),
                child: const Text("Page Not Found",

                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizing().extraSpacing,
                  vertical: AppSizing().extraSpacing,
                ),
                child: const Text("No module was found on this app, try to contact IT"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizing().extraSpacing,
                  vertical: AppSizing().extraSpacing,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.themeRed,
                        elevation: 0
                    ),
                    onPressed: () => Get.offAllNamed(PageRoutes.dashboard),
                    child: const Text("Go to Home"),
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