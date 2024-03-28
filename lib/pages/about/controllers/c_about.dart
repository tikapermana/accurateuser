import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AboutController extends GetxController{
  var lsBio = [
    {
      'icon': Icon(Icons.person),
      'name': 'I Gede Tika Permana'
    },
    {
      'icon': Icon(Icons.location_on_sharp),
      'address': 'Kalideres, Jakarta Barat'
    },
    {
      'icon': Icon(Icons.phone),
      'phone': "+6281233517323"
    },
    {
      'icon': Icon(Icons.email_rounded),
      'email': 'newgedetikapermana@gmail.com'
    },
  ];

  var lsEducation = [
    {
      'icon': Icon(Icons.cast_for_education_rounded),
      'title': 'Bachelor Degree of Computer Science',
      'university': 'Universitas Brawijaya',
      'date': '2015 Until 2020'
    },
    {
      'icon': Icon(Icons.cast_for_education_rounded),
      'title': 'High School',
      'university': 'SMA Negeri 5 Denpasar',
      'date': '2012 Until 2015'
    }
  ];

  var lsJob = [
    {
      'icon': Icon(Icons.apartment_rounded),
      'office': 'PT. Mayora Indah Tbk.',
      'university': 'Kalideres, Jakarta Barat',
      'date': '22 Feb 2021 Until Now'
    },
    {
      'icon': Icon(Icons.airplanemode_active_rounded),
      'office': 'AdIns - Malang Development Center',
      'university': 'Sumberjo, Malang',
      'date': '16 Sep 2019 Until 8 Apr 2020'
    }
  ];
}