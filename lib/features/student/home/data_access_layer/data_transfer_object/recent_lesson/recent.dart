class Recent {
  
  String? subjectId;

  String? iconOfList;

  int? lessonId;

  String? lessonName;

  int? userPoints;

  int? lessonPoints;

  double? progress;

  Recent();

  @override
  String toString() {
    return 'Recent[subjectId=$subjectId, iconOfList=$iconOfList, lessonId=$lessonId, lessonName=$lessonName, userPoints=$userPoints, lessonPoints=$lessonPoints, progress=$progress, ]';
  }

  Recent.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    subjectId = json['subjectId'];
    iconOfList = json['iconOfList'];
    lessonId = json['lessonId'];
    lessonName = json['lessonName'];
    userPoints = json['userPoints'];
    lessonPoints = json['lessonPoints'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectId,
      'iconOfList': iconOfList,
      'lessonId': lessonId,
      'lessonName': lessonName,
      'userPoints': userPoints,
      'lessonPoints': lessonPoints,
      'progress': progress
     };
  }

  static List<Recent> listFromJson(List<dynamic>? json) {
    return json == null ? List<Recent>.empty() : json.map((value) => Recent.fromJson(value)).toList();
  }

  static Map<String, Recent> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, Recent>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = Recent.fromJson(value));
    }
    return map;
  }
}
