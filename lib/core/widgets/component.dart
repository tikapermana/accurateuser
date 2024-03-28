import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/constants/themes.dart';

class BaseComponents {
  onShowMessage({
    int? duration,
    required String title,
    required Color colors,
    required String content,
    required SnackPosition position
  }){
    Get.snackbar(
      title,
      content,
      snackPosition: position,
      backgroundColor: colors,
      colorText: Colors.white,
      borderRadius: AppSizing().minSpacing,
      margin: EdgeInsets.all(AppSizing().defaultSpacing),
      duration: Duration(milliseconds: duration ?? 4500),
      animationDuration: Duration(milliseconds: AppThemes().standAnimationDuration),
    );
  }

  onShowLoadingIndicator({
    required String asset, String? value, Color? textColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: Get.size.height * .3,
                  maxWidth: Get.size.width * .3,
                  minWidth: 0.0,
                  minHeight: 0.0
              ),
              child: Lottie.asset(
                  asset,
                  repeat: true, frameRate: FrameRate.max
              ),
            )
        ),
        value != null ? DefaultTextStyle(
          style: AppText().textHeader4(color: textColor!),
          child: Text(value,
            style: AppText().textHeader4(color: textColor),
          ),
        ) : const SizedBox()
      ],
    );
  }
}

class InitialContainer extends StatelessWidget {
  final String initial;
  const InitialContainer({Key? key, required this.initial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension,
      width: kMinInteractiveDimension,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(AppSizing().defaultSpacing),
      ),
      padding: EdgeInsets.all(AppSizing().defaultSpacing),
      margin: EdgeInsets.all(AppSizing().defaultSpacing),
      child: Align(
        alignment: Alignment.center,
        child: Text(initial,
          style: AppText().textHeader4ExtraBold(color: Colors.black),
        ),
      ),
    );
  }
}

class RowContainer extends StatelessWidget {
  final String title;
  final String content;

  const RowContainer({
    Key? key,
    required this.title,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.size.width * 0.28,
          child: Text(title, style: AppText().textHeader5(color: Colors.grey)),
        ),
        SizedBox(
          width: AppSizing().defaultSpacing,
          child: Text(":", style: AppText().textHeader5(color: Colors.grey)),
        ),
        Expanded(
          child: Text(content, style: AppText().textHeader5Bold(color: Colors.grey.shade800)
          ),
        ),
      ],
    );
  }
}

class ColumnContainer extends StatelessWidget {
  final String title;
  final String content;

  const ColumnContainer({
    Key? key,
    required this.title,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: AppText().textHeader6(
                color: Colors.grey.shade400
            ),
            children: [
              TextSpan(
                text: ":",
                style: AppText().textHeader6(
                    color: Colors.grey.shade400
                ),
              ),
            ],
          ),
        ),
        Text(content,
            style: AppText().textHeader5Bold(
                color: Colors.grey.shade800
            )
        ),
      ],
    );
  }
}

class RowColumnContainer extends StatelessWidget {
  final String title1;
  final String content1;
  final String title2;
  final String content2;

  const RowColumnContainer({
    Key? key,
    required this.title1,
    required this.content1,
    required this.title2,
    required this.content2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: title1,
                  style: AppText().textHeader6(
                      color: Colors.grey.shade400
                  ),
                  children: [
                    TextSpan(
                      text: ":",
                      style: AppText().textHeader6(
                          color: Colors.grey.shade400
                      ),
                    ),
                  ],
                ),
              ),
              Text(content1,
                  style: AppText().textHeader5Bold(
                      color: Colors.grey.shade800
                  )
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: title2,
                  style: AppText().textHeader6(
                      color: Colors.grey.shade400
                  ),
                  children: [
                    TextSpan(
                      text: ":",
                      style: AppText().textHeader6(
                          color: Colors.grey.shade400
                      ),
                    ),
                  ],
                ),
              ),
              Text(content2,
                  style: AppText().textHeader5Bold(
                      color: Colors.grey.shade800
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FormInputTextIcon extends StatelessWidget {
  final String title;
  final bool txtEnable;
  final Color borderColors;
  final TextInputType textInputType;
  final TextEditingController txtController;
  final ValueChanged listType;

  const FormInputTextIcon({
    Key? key,
    required this.title,
    required this.txtEnable,
    required this.borderColors,
    required this.txtController,
    required this.textInputType,
    required this.listType
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizing().biggerSpacing,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              enabled: txtEnable,
              controller: txtController,
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: title,
                hintStyle: AppText().textHeader4(
                    color: Colors.grey.shade400
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      AppSizing().defaultSpacing
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  top: AppSizing().defaultSpacing,
                  left: AppSizing().defaultSpacing,
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColors,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(
                      AppSizing().defaultSpacing
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(
                      AppSizing().defaultSpacing
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade300,
                  size: AppSizing().extraSpacing,
                )
              ),
              style:  AppText().textHeader4(color: Colors.grey.shade800),
              onChanged: (value) => listType(value),
            ),
          ),
        ],
      ),
    );
  }
}

class FormInputTextMandatory extends StatelessWidget {
  final int txtLine;
  final String title;
  final int? maxLength;
  final bool txtEnable;
  final Color borderColors;
  final String? validatorMsg;
  final bool txtReadonly;
  final TextInputType textInputType;
  final TextEditingController txtController;
  final List<TextInputFormatter>? inputFormat;

  const FormInputTextMandatory({
    Key? key,
    this.maxLength,
    this.inputFormat,
    this.validatorMsg,
    required this.title,
    required this.txtLine,
    required this.txtEnable,
    required this.txtReadonly,
    required this.borderColors,
    required this.txtController,
    required this.textInputType,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizing().biggerSpacing,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSizing().minSpacing
            ),
            child: Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: AppText().textHeader5(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: '*',
                          style: AppText().textHeader5(color: Colors.red)
                      ),
                    ],
                  ),
                )
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              maxLines: txtLine,
              enabled: txtEnable,
              maxLength: maxLength,
              readOnly: txtReadonly,
              controller: txtController,
              keyboardType: textInputType,
              inputFormatters: inputFormat ?? [],
              validator: (value) => (value == null || value.isEmpty) ?
              validatorMsg : null,
              decoration: InputDecoration(
                hintText: title,
                hintStyle: AppText().textHeader4(
                    color: Colors.grey.shade400
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      AppSizing().defaultSpacing
                  ),
                ),
                contentPadding: EdgeInsets.only(
                    top: AppSizing().defaultSpacing,
                    left: AppSizing().defaultSpacing,
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColors,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(
                      AppSizing().defaultSpacing
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(
                      AppSizing().defaultSpacing
                  ),
                ),
              ),
              style: const TextStyle(
                  fontSize: 15
              ),
            ),
          ),
        ],
      ),
    );
  }
}