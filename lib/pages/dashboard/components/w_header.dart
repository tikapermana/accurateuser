import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';

class Header extends GetView<DashboardController> {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() =>
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: controller.mainController.greetingMessage.value,
                  style: AppText().textHeader4ExtraBold(
                      color: Colors.grey.shade500
                  ),
                  children: [
                    TextSpan(
                      text: "Guest",
                      style: AppText().textHeader4ExtraBold(
                          color: Colors.grey.shade800
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
        IconButton(
            onPressed: () => controller.onToAboutPage(),
            icon: const Icon(
                Icons.add_chart_sharp,
                size: 22
            )
        )
      ],
    );
  }
}
