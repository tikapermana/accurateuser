import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:accurate/core/widgets/city.dart';
import 'package:accurate/core/models/m_form.dart';
import 'package:accurate/core/models/m_city.dart';
import 'package:accurate/core/models/api_data.dart';
import 'package:accurate/core/models/api_user.dart';
import 'package:accurate/core/constants/themes.dart';
import 'package:accurate/core/services/app_url.dart';
import 'package:accurate/core/widgets/component.dart';
import 'package:accurate/core/services/api_rest.dart';
import 'package:accurate/pages/dashboard/controllers/c_dashboard.dart';

class AppMainController extends GetxController {
  final lsModule = ['Data User', 'Data City'];

  var isLoading = false.obs;
  var greetingMessage = 'Welcome, '.obs;

  var lsMUser = List<ModelUser>.empty(growable: true).obs;
  var lsMCity = List<ModelCity>.empty(growable: true).obs;

  List<ModelForm> formSettings = [
    ModelForm(title: "Name", length: 30, mandatory: true,
        txtLine: 1, textInputType: TextInputType.text),
    ModelForm(title: "Address", length: 100, mandatory: true,
        txtLine: 1, textInputType: TextInputType.text),
    ModelForm(title: "Email", length: 50, mandatory: true,
        txtLine: 1, textInputType: TextInputType.emailAddress),
    ModelForm(title: "Phone Number", length: 12, mandatory: true,
        txtLine: 1, textInputType: TextInputType.number),
    ModelForm(title: "City", length: 100, mandatory: false,
        txtLine: 1, textInputType: TextInputType.text)
  ];

  @override
  void onInit() async {
    onGreetingUser();
    await onGetMasterData();
    super.onInit();
  }

  @override
  void onReady() async {
    Timer.periodic(const Duration(minutes: 5), (timer) => onGreetingUser());
    super.onReady();
  }

  onFocusNode(){
    if(FocusManager.instance.primaryFocus?.hasPrimaryFocus != null ||
        FocusManager.instance.primaryFocus?.hasFocus != null){
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void onSelectCity({
    required String title,
    required List<ModelCity> lsCity,
    required TextEditingController txtController}) {
    Get.to(() => ListCity(
        title: title,
        lsCity: lsCity,
        txtController: txtController)
    );
  }

  void onGreetingUser(){
    DateTime currentTime = DateTime.now();
    int currHour  = int.parse(DateFormat('kk').format(currentTime));

    if(currHour > 1 && currHour <= 10){
      greetingMessage.value = "Good Morning, ";
    } else if(currHour > 10 && currHour <= 18) {
      greetingMessage.value = "Good Afternoon, ";
    } else if(currHour > 18 && currHour < 24) {
      greetingMessage.value = "Good Evening, ";
    } else {
      greetingMessage.value = "Welcome, ";
    }
  }

  Future<void> onGetMasterData() async {
    isLoading(true);
    await Future.wait([
      onFetchData(
          module: lsModule[0],
          url: BaseHost.httpsHost + BaseRoutes.routeApi +
              BaseRoutes.routeVersion + BaseRoutes.routeUrl + BaseDestination.user)
          .then((dataModel) => onFilterData(data: dataModel)),
      onFetchData(
          module: lsModule[1],
          url: BaseHost.httpsHost + BaseRoutes.routeApi +
              BaseRoutes.routeVersion + BaseRoutes.routeUrl + BaseDestination.user)
          .then((dataModel) => onFilterData(data: dataModel)),
    ]).catchError((catchError){
      log('error $catchError');
    }).then((_){
      var dashboardController = Get.isRegistered<DashboardController>() ?
          Get.find<DashboardController>() : Get.put(DashboardController());
      dashboardController.lsUser.clear();
      dashboardController.lsCity.clear();
      dashboardController.lsUser.addAll(lsMUser);
      dashboardController.lsCity.addAll(lsMCity);
    }).then((_) => isLoading(false));
  }

  Future<ApiDataModel> onFetchData({
    required String url,
    required String module
  }) async {
    var dataModel = ApiDataModel();
    try {
      await ApiRest().onFetchOrProcessData(
        url: url,
        module: module,
        methodType: ApiRest.methodGet,
      ).timeout(Duration(seconds: ApiRest.defaultTimeOutTime),
          onTimeout: () => ApiRest().onTimeOutConnection(module: module)
      ).then((result) => dataModel = result);
    } catch (e) {
      log('cannot get data $module');
      BaseComponents().onShowMessage(
          title: "Something when wrong",
          colors: AppColors.themeRed,
          content: "Something when wrong when getting Data $module",
          position: SnackPosition.TOP
      );
    }
    return dataModel;
  }

  void onFilterData({required ApiDataModel data}) {
    log(jsonEncode(data.body!));
    try {
      if(data.code != 200 && data.body != null){
        BaseComponents().onShowMessage(
            title: data.api! + data.subtitle!,
            colors: AppColors.themeRed,
            content: data.title!,
            position: SnackPosition.TOP
        );
      } else {
        switch (data.module!) {
          case "Data User":
            for(var dt in jsonDecode(data.body!)){
              lsMUser.add(ModelUser.fromJson(dt));
            }
            break;
          case "Data City":
            for(var dt in jsonDecode(data.body!)){
              lsMCity.add(ModelCity.fromJson(dt));
            }
            break;
        }
      }
    } catch (e) {
      String module = data.module!;
      log('error get $module ' + e.toString());
    }
  }

}

// String dummyUSERJSON = "[
// {
// "name": "Yovi",
// "address": "tangerang",
// "email": "yovi@gmail.com",
// "phoneNumber": "08123123",
// "city": "city 1",
// "id": "1"
// },
// {
// "name": "Paijo",
// "address": "tangerang",
// "email": "paijo@gmail.com",
// "phoneNumber": "08123123",
// "city": "city 2",
// "id": "2"
// },
// {
// "name": "paijo",
// "address": "sampun",
// "email": "haha@gm.com",
// "phoneNumber": "0921",
// "city": "Jambi",
// "id": "3"
// },
// {
// "name": "coba",
// "address": "Jakarta",
// "email": "das.com",
// "phoneNumber": "03232098434",
// "city": "Jakarta",
// "id": "4"
// },
// {
// "name": "janeta",
// "address": "mayata",
// "email": "masaka@gmailc.co",
// "phoneNumber": "03213",
// "city": "Palembang",
// "id": "5"
// },
// {
// "name": "andy",
// "address": "fare",
// "email": "masaka@gmailc.co",
// "phoneNumber": "03213",
// "city": "Aceh",
// "id": "6"
// },
// {
// "name": "upin",
// "address": "Jo durian runtuh",
// "email": "upin@ipin.co.id",
// "phoneNumber": "90123",
// "city": "Tangerang Selatan",
// "id": "7"
// },
// {
// "name": "Reza Fahlevi",
// "address": "BSD",
// "email": "reza@gmail.com",
// "phoneNumber": "0811223344",
// "city": "Tangerang",
// "id": "8"
// },
// {
// "name": "jdjd",
// "address": "hrhr",
// "email": "hrhr",
// "phoneNumber": "hrhr",
// "city": "jdjr",
// "id": "9"
// },
// {
// "name": "roby",
// "address": "jakarta kebon jeruk",
// "email": "robysetiawan2409@gmail.com",
// "phoneNumber": "08123123",
// "city": "jakarta",
// "id": "10"
// },
// {
// "name": "roby",
// "address": "address 11",
// "email": "email 11",
// "phoneNumber": "phoneNumber 11",
// "city": "city 11",
// "id": "11"
// },
// {
// "name": "roby",
// "address": "address 12",
// "email": "email 12",
// "phoneNumber": "phoneNumber 12",
// "city": "city 12",
// "id": "12"
// },
// {
// "name": "name 13",
// "address": "address 13",
// "email": "email 13",
// "phoneNumber": "phoneNumber 13",
// "city": "city 13",
// "id": "13"
// },
// {
// "name": "name 14",
// "address": "address 14",
// "email": "email 14",
// "phoneNumber": "phoneNumber 14",
// "city": "city 14",
// "id": "14"
// },
// {
// "name": "name 15",
// "address": "address 15",
// "email": "email 15",
// "phoneNumber": "phoneNumber 15",
// "city": "city 15",
// "id": "15"
// },
// {
// "name": "name 16",
// "address": "address 16",
// "email": "email 16",
// "phoneNumber": "phoneNumber 16",
// "city": "city 16",
// "id": "16",
// "query": "\n    query IntrospectionQuery {\n      __schema {\n        \n        queryType { name }\n        mutationType { name }\n        subscriptionType { name }\n        types {\n          ...FullType\n        }\n        directives {\n          name\n          description\n          \n          locations\n          args {\n            ...InputValue\n          }\n        }\n      }\n    }\n\n    fragment FullType on __Type {\n      kind\n      name\n      description\n      \n      fields(includeDeprecated: true) {\n        name\n        description\n        args {\n          ...InputValue\n        }\n        type {\n          ...TypeRef\n        }\n        isDeprecated\n        deprecationReason\n      }\n      inputFields {\n        ...InputValue\n      }\n      interfaces {\n        ...TypeRef\n      }\n      enumValues(includeDeprecated: true) {\n        name\n        description\n        isDeprecated\n        deprecationReason\n      }\n      possibleTypes {\n        ...TypeRef\n      }\n    }\n\n    fragment InputValue on __InputValue {\n      name\n      description\n      type { ...TypeRef }\n      defaultValue\n      \n      \n    }\n\n    fragment TypeRef on __Type {\n      kind\n      name\n      ofType {\n        kind\n        name\n        ofType {\n          kind\n          name\n          ofType {\n            kind\n            name\n            ofType {\n              kind\n              name\n              ofType {\n                kind\n                name\n                ofType {\n                  kind\n                  name\n                  ofType {\n                    kind\n                    name\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  "
// },
// {
// "name": "name 17",
// "address": "address 17",
// "email": "email 17",
// "phoneNumber": "phoneNumber 17",
// "city": "city 17",
// "id": "17",
// "query": ""
// },
// {
// "name": "name 18",
// "address": "address 18",
// "email": "email 18",
// "phoneNumber": "phoneNumber 18",
// "city": "city 18",
// "id": "18",
// "query": ""
// },
// {
// "name": "name 19",
// "address": "address 19",
// "email": "email 19",
// "phoneNumber": "phoneNumber 19",
// "city": "city 19",
// "id": "19",
// "query": "\n    query IntrospectionQuery {\n      __schema {\n        \n        queryType { name }\n        mutationType { name }\n        subscriptionType { name }\n        types {\n          ...FullType\n        }\n        directives {\n          name\n          description\n          \n          locations\n          args {\n            ...InputValue\n          }\n        }\n      }\n    }\n\n    fragment FullType on __Type {\n      kind\n      name\n      description\n      \n      fields(includeDeprecated: true) {\n        name\n        description\n        args {\n          ...InputValue\n        }\n        type {\n          ...TypeRef\n        }\n        isDeprecated\n        deprecationReason\n      }\n      inputFields {\n        ...InputValue\n      }\n      interfaces {\n        ...TypeRef\n      }\n      enumValues(includeDeprecated: true) {\n        name\n        description\n        isDeprecated\n        deprecationReason\n      }\n      possibleTypes {\n        ...TypeRef\n      }\n    }\n\n    fragment InputValue on __InputValue {\n      name\n      description\n      type { ...TypeRef }\n      defaultValue\n      \n      \n    }\n\n    fragment TypeRef on __Type {\n      kind\n      name\n      ofType {\n        kind\n        name\n        ofType {\n          kind\n          name\n          ofType {\n            kind\n            name\n            ofType {\n              kind\n              name\n              ofType {\n                kind\n                name\n                ofType {\n                  kind\n                  name\n                  ofType {\n                    kind\n                    name\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  "
// },
// {
// "name": "dustin",
// "address": "Tangerang",
// "email": "dustin@gmail.com",
// "phoneNumber": "0849098434",
// "city": "jakarta",
// "id": "20"
// },
// {
// "name": "zzzzzz",
// "address": "Tangerang",
// "email": "tiko@gmail.com",
// "phoneNumber": "0849098434",
// "city": "Tangerang",
// "id": "21"
// },
// {
// "name": "Bujang02",
// "address": "Tangerang",
// "email": "tiko@gmail.com",
// "phoneNumber": "0849098434",
// "city": "Tangerang",
// "id": "22"
// }
// ]";

// String dummyJSONCITY = "[{"name":"Aceh","id":"1"},{"name":"Medan","id":"2"},{"name":"Padang","id":"3"},{"name":"Jambi","id":"4"},{"name":"Bengkulu","id":"5"},{"name":"Palembang","id":"6"},{"name":"Tangerang","id":"7"},{"name":"Jakarta","id":"8"},{"name":"Bandung","id":"9"},{"name":"Yogyakarta","id":"10"},{"name":"Surabaya","id":"11"},{"name":"Malang","id":"12"},{"name":"Tangerang Selatan","id":"13"}]";