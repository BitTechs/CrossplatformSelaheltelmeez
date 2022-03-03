import 'dart:convert';
/// listSection : [{"listItem":[{"name":"عربي","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/ara.png","url":"zbqLv_6kids"},{"name":"علوم","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/sci.png","url":"CxxlbaF2YQE"},{"name":"انجليزي","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/eng.png","url":"BSrOE7KS944"},{"name":"رياضيات","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/mth.png","url":"asuF1bPMT5w"},{"name":"دراسات اجتماعية","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/soc.png","url":"b_jj6YWyTJA"}]},{"listItem":[{"name":"سلاح التلميذ","type":"html","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/About.png","url":"http://www.almoallem.com/media/LMSApp/home/html/About.html"},{"name":"أهدافنا","type":"html","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/features.png","url":"http://www.almoallem.com/media/LMSApp/home/html/features.html"},{"name":"مميزات التطبيق","type":"html","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/steps.png","url":"http://www.almoallem.com/media/LMSApp/home/html/steps.html"},{"name":"اتصل بنا","type":"html","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/contactUs.png","url":"http://www.almoallem.com/media/LMSApp/home/html/contactUs.html"}]},{"listItem":[{"name":"تطبيق JoySchool","type":"html","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/Joy.png","url":"http://www.almoallem.com/media/LMSApp/home/html/Joy.html"}]}]

LandingSection landingSectionFromJson(String str) => LandingSection.fromJson(json.decode(str));
String landingSectionToJson(LandingSection data) => json.encode(data.toJson());

class LandingSection {
  LandingSection({
      List<ListSection>? listSection,}){
    _listSection = listSection;
}

  LandingSection.fromJson(dynamic json) {
    if (json['listSection'] != null) {
      _listSection = [];
      json['listSection'].forEach((v) {
        _listSection?.add(ListSection.fromJson(v));
      });
    }
  }
  List<ListSection>? _listSection;

  List<ListSection>? get listSection => _listSection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_listSection != null) {
      map['listSection'] = _listSection?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// listItem : [{"name":"عربي","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/ara.png","url":"zbqLv_6kids"},{"name":"علوم","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/sci.png","url":"CxxlbaF2YQE"},{"name":"انجليزي","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/eng.png","url":"BSrOE7KS944"},{"name":"رياضيات","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/mth.png","url":"asuF1bPMT5w"},{"name":"دراسات اجتماعية","type":"youtube","description":"","thumbnail":"http://www.almoallem.com/media/LMSApp/home/images/soc.png","url":"b_jj6YWyTJA"}]

ListSection listSectionFromJson(String str) => ListSection.fromJson(json.decode(str));
String listSectionToJson(ListSection data) => json.encode(data.toJson());
class ListSection {
  ListSection({
      List<ListItem>? listItem,}){
    _listItem = listItem;
}

  ListSection.fromJson(dynamic json) {
    if (json['listItem'] != null) {
      _listItem = [];
      json['listItem'].forEach((v) {
        _listItem?.add(ListItem.fromJson(v));
      });
    }
  }
  List<ListItem>? _listItem;

  List<ListItem>? get listItem => _listItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_listItem != null) {
      map['listItem'] = _listItem?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "عربي"
/// type : "youtube"
/// description : ""
/// thumbnail : "http://www.almoallem.com/media/LMSApp/home/images/ara.png"
/// url : "zbqLv_6kids"

ListItem listItemFromJson(String str) => ListItem.fromJson(json.decode(str));
String listItemToJson(ListItem data) => json.encode(data.toJson());
class ListItem {
  ListItem({
      String? name, 
      String? type, 
      String? description, 
      String? thumbnail, 
      String? url,}){
    _name = name;
    _type = type;
    _description = description;
    _thumbnail = thumbnail;
    _url = url;
}

  ListItem.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _description = json['description'];
    _thumbnail = json['thumbnail'];
    _url = json['url'];
  }
  String? _name;
  String? _type;
  String? _description;
  String? _thumbnail;
  String? _url;

  String? get name => _name;
  String? get type => _type;
  String? get description => _description;
  String? get thumbnail => _thumbnail;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['description'] = _description;
    map['thumbnail'] = _thumbnail;
    map['url'] = _url;
    return map;
  }

}