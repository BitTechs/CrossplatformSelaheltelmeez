import 'dart:convert';
/// baseUrl : "https://appservicesfree.azurewebsites.net/api"

AppConfig appConfigFromJson(String str) => AppConfig.fromJson(json.decode(str));
String appConfigToJson(AppConfig data) => json.encode(data.toJson());
class AppConfig {
  AppConfig({
      String? baseUrl,}){
    _baseUrl = baseUrl;
}

  AppConfig.fromJson(dynamic json) {
    _baseUrl = json['baseUrl'];
  }
  String? _baseUrl;

  String? get baseUrl => _baseUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['baseUrl'] = _baseUrl;
    return map;
  }

}