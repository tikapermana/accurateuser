import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/pages/dashboard/components/w_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/widgets/component.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';

class Body extends GetView<DashboardController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSizing().veryExtraSpacing
      ),
      child: Row(
            children: [
              Expanded(
                child: FormInputTextIcon(
                  title: 'Find User',
                  txtEnable: true,
                  borderColors: Colors.grey.shade400,
                  txtController: controller.fieldFind,
                  textInputType: TextInputType.text,
                  listType: (value) => controller.onFindUser(value),
                ),
              ),
              IconButton(
                  onPressed: (){
                    controller.isDialogOpen(true);
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
                        return const SortByContainer();
                      },
                    );
                  },
                  icon: Icon(Icons.sort_rounded, color: Colors.grey.shade500,)
              )
        ],
      ),
    );
  }
}
