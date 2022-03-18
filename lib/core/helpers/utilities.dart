class  Utilities{
  static String? isEmail(String? value){
    if(value == null) return null;
    RegExp regExp = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([azA-Z]{2,4}|[0-9]{1,3})(\]?)$",
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(value) ? value : null;
  }

  static String? isMobile(String? value){
    if(value == null) return null;
    RegExp regExp = RegExp(r"^01[0-2,5]\d{8}$",caseSensitive: false,multiLine: false,);
    return regExp.hasMatch(value) ? value : null;
  }
}