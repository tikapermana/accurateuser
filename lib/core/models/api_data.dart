class ApiDataModel {
  int? code;
  String? api;
  String? title;
  String? subtitle;
  String? body;
  String? module;

  ApiDataModel({
    this.code, this.api, this.title, this.subtitle, this.body, this.module
  });

  ApiDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    api = json['api'];
    title = json['title'];
    subtitle = json['subtitle'];
    body = json['body'];
    module = json['module'];
  }

  ApiDataModel.fromMap(Map<String, dynamic> map) {
    code = map['code'];
    api = map['api'];
    title = map['title'];
    subtitle = map['subtitle'];
    body = map['body'];
    module = map['module'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['api'] = api;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['body'] = body;
    data['module'] = module;
    return data;
  }
}