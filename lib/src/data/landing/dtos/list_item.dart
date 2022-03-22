class ListItem {
  
  String? name;

  String? type;

  String? description;

  String? thumbnail;

  String? url;

  ListItem();

  @override
  String toString() {
    return 'ListItem[name=$name, type=$type, description=$description, thumbnail=$thumbnail, url=$url, ]';
  }

  ListItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'];
    type = json['type'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'description': description,
      'thumbnail': thumbnail,
      'url': url
     };
  }

  static List<ListItem> listFromJson(List<dynamic>? json) {
    return json == null ?  List<ListItem>.empty() : json.map((value) => ListItem.fromJson(value)).toList();
  }

  static Map<String, ListItem> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, ListItem>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = ListItem.fromJson(value));
    }
    return map;
  }
}
