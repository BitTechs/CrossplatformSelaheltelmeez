import 'package:selaheltelmeez/src/data/landing/dtos/list_item.dart';

class Section {
  List<ListItem> listItem = [];
  Section();
  @override
  String toString() {
    return 'Section[listItem=$listItem, ]';
  }
  Section.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    listItem = ListItem.listFromJson(json['listItem']);
  }
  Map<String, dynamic> toJson() {
    return {
      'listItem': listItem
     };
  }
  static List<Section> listFromJson(List<dynamic>? json) {
    return json == null ? List<Section>.empty() : json.map((value) => Section.fromJson(value)).toList();
  }

  static Map<String, Section> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, Section>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = Section.fromJson(value));
    }
    return map;
  }
}
