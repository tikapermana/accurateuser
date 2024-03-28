import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/core/widgets/component.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';

class ModalBottomSheetContainer extends StatelessWidget {
  final String containerType;

  const ModalBottomSheetContainer({
    Key? key, required this.containerType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return containerType == 'SORT' ?
    const SortByContainer() : const FormInputContainer();
  }
}

class SortByContainer extends GetView<DashboardController> {
  const SortByContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizing().biggerSpacing,
            horizontal: AppSizing().defaultSpacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizing().biggerSpacing
                ),
                child: RichText(
                  text: TextSpan(
                    text: "Sort By",
                    style: AppText().textHeader3ExtraBold(
                        color: Colors.grey.shade800
                    ),
                    children: [
                      const TextSpan(text: "\n"),
                      TextSpan(
                        text: "Select sort type to sorting the User",
                        style: AppText().textHeader5(
                            color: Colors.grey.shade400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.sortBy.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  var sort = controller.sortBy[index];
                  return InkWell(
                    onTap: () => controller.onSortUser(sort['type'].toString()),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizing().biggerSpacing,
                        horizontal: AppSizing().defaultSpacing,
                      ),
                      child: Text(
                        sort['title'].toString(),
                        style: AppText().textHeader5ExtraBold(
                            color: Colors.grey.shade800
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FormInputContainer extends GetView<DashboardController> {
  const FormInputContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizing().biggerSpacing,
            horizontal: AppSizing().defaultSpacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizing().biggerSpacing
                ),
                child: RichText(
                  text: TextSpan(
                    text: "Input User",
                    style: AppText().textHeader3ExtraBold(
                        color: Colors.grey.shade800
                    ),
                    children: [
                      const TextSpan(text: "\n"),
                      TextSpan(
                        text: "Fill form down below to add new User",
                        style: AppText().textHeader5(
                            color: Colors.grey.shade400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.lsFormInput.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  var form = controller.lsFormInput[index];
                  return GestureDetector(
                    onTap: () => form.title.toLowerCase() == 'city' ?
                    controller.mainController.onSelectCity(
                      title: 'Find City',
                      lsCity: controller.lsCity,
                      txtController: form.txtController!
                    ) : null,
                    child: FormInputTextMandatory(
                      title: form.title,
                      txtLine: form.txtLine,
                      maxLength: form.length,
                      borderColors: Colors.grey.shade300,
                      txtController: form.txtController!,
                      textInputType: form.textInputType!,
                      validatorMsg: "Please fille the " + form.title + " Form",
                      txtEnable: form.title.toLowerCase() == 'city' ? false : true,
                      txtReadonly: form.title.toLowerCase() == 'city' ? true : false,
                    ),
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: kMinInteractiveDimension,
                margin: EdgeInsets.symmetric(
                  vertical: AppSizing().extraSpacing,
                  horizontal: AppSizing().biggerSpacing,
                ),
                child: ElevatedButton.icon(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            AppSizing().defaultSpacing
                        )
                    ),
                  ),
                  label: Text(
                    'Submit Data',
                    style: AppText().textHeader4(
                        color: Colors.white
                    ),
                  ),
                  icon: Icon(
                    Icons.save,
                    size: AppSizing().extraSpacing,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}


