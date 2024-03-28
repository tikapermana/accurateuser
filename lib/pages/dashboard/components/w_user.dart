import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/core/constants/assets.dart';
import 'package:accurate/core/widgets/component.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';

class ListUser extends GetView<DashboardController> {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() =>
      controller.mainController.isLoading.isTrue ?
        Center(
            child: BaseComponents().onShowLoadingIndicator(
              asset: AppAssets.loading,
              value: "Loading data..",
                textColor: Colors.black
            )
        ) :
      controller.mainController.isLoading.isFalse && controller.lsUser.isEmpty ?
        Center(
            child: BaseComponents().onShowLoadingIndicator(
                asset: AppAssets.notFound,
                value: "No data found",
                textColor: Colors.black
            )
        ) :
        NotificationListener(
          onNotification: (Notification notify) =>
              controller.onShowScrollToTop(notify),
          child: RefreshIndicator(
            onRefresh: () => controller.mainController.onGetMasterData(),
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: (controller.lsUser.length + 1),
                controller: controller.userScrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                Divider(
                  thickness: 1.0,
                  color: Colors.grey.shade200,
                  indent: AppSizing().minSpacing,
                  endIndent: AppSizing().minSpacing,
                  height: AppSizing().biggerSpacing,
                ),
                itemBuilder: (context, index){
                    return (index == controller.lsUser.length) ?
                    Container(height: Get.size.height * .1) :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InitialContainer(
                                initial: controller.lsUser[index].name != null ?
                                controller.lsUser[index].name!.substring(0, 2) : "-"
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.lsUser[index].name ?? "-",
                                    style: AppText().textHeader4ExtraBold(
                                        color: Colors.grey.shade800
                                    ),
                                  ),
                                  Text(controller.lsUser[index].email ?? "-",
                                    style: AppText().textHeader5(
                                        color: Colors.grey.shade800
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizing().biggerSpacing
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowColumnContainer(
                                title1: 'Phone Number',
                                content1: controller.lsUser[index].phoneNumber ?? "-",
                                title2: 'City',
                                content2: controller.lsUser[index].city ?? "-",
                              ),
                              SizedBox(height: AppSizing().minSpacing),
                              ColumnContainer(
                                title: 'Address',
                                content: controller.lsUser[index].address ?? "-",
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                }
            ),
          ),
        )
      )
    );
  }
}

