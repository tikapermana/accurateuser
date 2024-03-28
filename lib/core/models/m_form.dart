import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ModelForm {
  int length;
  int txtLine;
  String title;
  bool mandatory;
  TextInputType? textInputType;
  TextEditingController? txtController;
  List<TextInputFormatter>? inputFormat;

  ModelForm({
    required this.title,
    required this.length,
    required this.txtLine,
    required this.mandatory,
    this.inputFormat,
    this.textInputType,
    this.txtController,
  });

}