import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/pages/dashboard/components/body.dart';
import 'package:accurate/pages/dashboard/components/w_user.dart';
import 'package:accurate/pages/dashboard/components/w_header.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';
import 'package:accurate/pages/dashboard/components/w_bottom_sheet.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(AppSizing().defaultSpacing),
          child: Column(
            children: const [
              Header(),
              Body(),
              ListUser(),
            ],
          ),
        ),
        floatingActionButton:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: AppSizing().extraSpacing,
              ),
              height: kMinInteractiveDimension,
              child: FloatingActionButton.extended(
                label: const Text('Add'),
                backgroundColor: Colors.black,
                icon: const Icon(Icons.add, color: Colors.white, size: 25),
                onPressed: (){
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizing().extraSpacing),
                          topRight: Radius.circular(AppSizing().extraSpacing),
                        )
                    ),
                    builder: (BuildContext context) {
                      return const FormInputContainer();
                    },
                  );
                },
              ),
            ),
            Obx(() => AnimatedContainer(
              margin: EdgeInsets.only(
                left: controller.isScrolling.isFalse ?
                0.0 : AppSizing().biggerSpacing,
                bottom: AppSizing().extraSpacing,
              ),
              width: controller.isScrolling.isFalse ? 0.0 : kMinInteractiveDimension,
              height: controller.isScrolling.isFalse ? 0.0 : kMinInteractiveDimension,
                duration: Duration(milliseconds: AppThemes().minAnimationDuration),
              child: FloatingActionButton(
                  backgroundColor: Colors.black,
                child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white, size: 25
                ),
                onPressed: () => controller.onScrollToTOp()
              ),
            ))
          ],
        )
      ),
    );
  }
}
