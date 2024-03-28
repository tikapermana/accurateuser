import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/models/m_city.dart';
import 'package:accurate/core/routing/pages.dart';
import 'package:accurate/core/models/m_form.dart';
import 'package:accurate/core/models/api_user.dart';
import 'package:accurate/core/services/app_url.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/core/widgets/component.dart';
import 'package:accurate/core/services/api_rest.dart';
import 'package:accurate/core/controllers/main_controller.dart';

class DashboardController extends GetxController {
  static const sortType1A = 'n_z-a';
  static const sortType1B = 'n_a-z';
  static const sortType2A = 'e_z-a';
  static const sortType2B = 'e_a-z';
  static const sortType3A = 'a_z-a';
  static const sortType3B = 'a_a-z';

  late AppMainController mainController;
  var fieldFind = TextEditingController();
  var userScrollController = ScrollController();

  var lsUser = List<ModelUser>.empty(growable: true).obs;
  var lsCity = List<ModelCity>.empty(growable: true).obs;
  var lsFormInput = List<ModelForm>.empty(growable: true).obs;

  var sortBy = [
    {'type': sortType1A, 'title': 'Name sort as Z-A'},
    {'type': sortType1B, 'title': 'Name sort as A-Z'},
    {'type': sortType2A, 'title': 'Email sort as Z-A'},
    {'type': sortType2B, 'title': 'Email sort as A-Z'},
    {'type': sortType3A, 'title': 'Address sort as Z-A'},
    {'type': sortType3B, 'title': 'Address sort as A-Z'},
    {'type': 'reset', 'title': 'Reset filter'},
  ];

  var isDialogOpen = false.obs;
  var isScrolling = false.obs;
  var isOnProcess = false.obs;

  @override
  void onInit() {
    lsUser.clear();
    lsCity.clear();
    mainController = Get.isRegistered<AppMainController>() ?
        Get.find<AppMainController>() : Get.put(AppMainController());
    onAssignFormSettings();
    super.onInit();
  }

  void onToAboutPage(){
    Get.toNamed(PageRoutes.account);
  }

  void onAssignFormSettings(){
    for(var formSetting in mainController.formSettings){
      ModelForm form = formSetting;
      form.txtController = TextEditingController();
      lsFormInput.add(form);
    }
  }

  bool onShowScrollToTop(Notification notify){
    if (notify is ScrollEndNotification) {
      log(userScrollController.position.pixels.toString());
    }
    if(userScrollController.hasClients){
      if(userScrollController.position.pixels > Get.size.height * .2){
        isScrolling(true);
      } else if(userScrollController.position.minScrollExtent == 0){
        isScrolling(false);
      }
    }
    return true;
  }

  void onScrollToTOp(){
    if(userScrollController.hasClients){
      userScrollController.animateTo(
          0.0,
          curve: Curves.linear,
          duration: Duration(milliseconds: AppThemes().standAnimationDuration)
      );
    }
  }

  void onFindUser(String input){
    if(input.isEmpty){
      lsUser.clear();
      lsUser.addAll(mainController.lsMUser);
    } else {
      String keyWord = input.toLowerCase();
      List<ModelUser> lsTempUser = [];
      for(var mUser in mainController.lsMUser){
        if(mUser.name != null && mUser.name!.toLowerCase().contains(keyWord) ||
            mUser.city != null && mUser.city!.toLowerCase().contains(keyWord) ||
            mUser.email != null && mUser.email!.toLowerCase().contains(keyWord) ||
            mUser.address != null && mUser.address!.toLowerCase().contains(keyWord) ||
            mUser.phoneNumber != null && mUser.phoneNumber!.toLowerCase().contains(keyWord)){
          lsTempUser.add(mUser);
        }
      }
      lsUser.clear();
      lsUser.addAll(lsTempUser);
    }
  }

  Future<void> onSortUser(String sortType) async {
    if(sortType == sortType1A){
      lsUser.sort((a, b) => b.name!.compareTo(a.name!));
    } else if (sortType == sortType1B) {
      lsUser.sort((a, b) => a.name!.compareTo(b.name!));
    } else if (sortType == sortType2A) {
      lsUser.sort((a, b) => b.email!.compareTo(a.email!));
    } else if (sortType == sortType2B) {
      lsUser.sort((a, b) => a.email!.compareTo(b.email!));
    } else if (sortType == sortType3A) {
      lsUser.sort((a, b) => b.address!.compareTo(a.address!));
    } else if (sortType == sortType3B) {
      lsUser.sort((a, b) => a.address!.compareTo(b.address!));
    } else {
      lsUser.clear();
      lsUser.addAll(mainController.lsMUser);
    }
    await Future.delayed(Duration(
        milliseconds: AppThemes().minAnimationDuration), (){
      if(isDialogOpen.isTrue) Get.back();
    });
  }

  Future<void> onSubmitData() async {
    isOnProcess(true);
    String module = "Submit User";
    Get.back(); //dismiss bottom navigation
    try {
      String url = BaseHost.httpsHost + BaseRoutes.routeApi +
          BaseRoutes.routeVersion + BaseRoutes.routeUrl + BaseDestination.user;
      await ApiRest().onFetchOrProcessData(
        url: url,
        module: module,
        methodType: ApiRest.methodPost,
      ).timeout(Duration(seconds: ApiRest.defaultTimeOutTime),
          onTimeout: () => ApiRest().onTimeOutConnection(module: module)
      ).then((result){
        if(result.code != 200){
          BaseComponents().onShowMessage(
              title: "Something when wrong",
              colors: AppColors.themeRed,
              content: "Something when wrong when submitting Data $module",
              position: SnackPosition.TOP
          );
        } else {
          BaseComponents().onShowMessage(
              title: "Success",
              colors: Colors.green,
              content: "Success submitting user",
              position: SnackPosition.TOP
          );
        }
      });
    } catch (e) {
      log('cannot submit data $module');
      BaseComponents().onShowMessage(
          title: "Something when wrong",
          colors: AppColors.themeRed,
          content: "Something when wrong when submitting Data $module",
          position: SnackPosition.TOP
      );
    }
    isOnProcess(false);
  }
}