

import 'package:selaheltelmeez/src/data/landing/dtos/section.dart';

class LandingSection {
  List<Section> listSection = [];
  LandingSection();

  @override
  String toString() {
    return 'LandingSection[listSection=$listSection, ]';
  }

  LandingSection.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    listSection = Section.listFromJson(json['listSection']);
  }

  Map<String, dynamic> toJson() {
    return {
      'listSection': listSection
     };
  }

  static List<LandingSection> listFromJson(List<dynamic>? json) {
    return json == null ? List<LandingSection>.empty() : json.map((value) => LandingSection.fromJson(value)).toList();
  }

  static Map<String, LandingSection> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, LandingSection>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = LandingSection.fromJson(value));
    }
    return map;
  }
}
