class Subject {
  
  String? subjectId;

  String? subjectName;

  String? iconOfList;

  String? iconOfSlider;

  String? coloredIcon;

  String? iconBackground;

  String? gradeName;

  int? grade;

  int? studentPoints;

  int? subjectPoints;

  String? numeral;

  int? term;

  String? termName;

  bool? subscribed;

  String? parentGuid;

  Subject();

  @override
  String toString() {
    return 'Subject[subjectId=$subjectId, subjectName=$subjectName, iconOfList=$iconOfList, iconOfSlider=$iconOfSlider, coloredIcon=$coloredIcon, iconBackground=$iconBackground, gradeName=$gradeName, grade=$grade, studentPoints=$studentPoints, subjectPoints=$subjectPoints, numeral=$numeral, term=$term, termName=$termName, subscribed=$subscribed, parentGuid=$parentGuid, ]';
  }

  Subject.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    subjectId = json['subjectId'];
    subjectName = json['subjectName'];
    iconOfList = json['iconOfList'];
    iconOfSlider = json['iconOfSlider'];
    coloredIcon = json['coloredIcon'];
    iconBackground = json['iconBackground'];
    gradeName = json['gradeName'];
    grade = json['grade'];
    studentPoints = json['studentPoints'];
    subjectPoints = json['subjectPoints'];
    numeral = json['numeral'];
    term = json['term'];
    termName = json['termName'];
    subscribed = json['subscribed'];
    parentGuid = json['parentGuid'];
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectId,
      'subjectName': subjectName,
      'iconOfList': iconOfList,
      'iconOfSlider': iconOfSlider,
      'coloredIcon': coloredIcon,
      'iconBackground': iconBackground,
      'gradeName': gradeName,
      'grade': grade,
      'studentPoints': studentPoints,
      'subjectPoints': subjectPoints,
      'numeral': numeral,
      'term': term,
      'termName': termName,
      'subscribed': subscribed,
      'parentGuid': parentGuid
     };
  }

  static List<Subject> listFromJson(List<dynamic>? json) {
    return json == null ? List<Subject>.empty() : json.map((value) => Subject.fromJson(value)).toList();
  }

  static Map<String, Subject> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, Subject>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = Subject.fromJson(value));
    }
    return map;
  }
}
