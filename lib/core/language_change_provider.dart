import 'package:flutter/cupertino.dart';

class LanguageChangeProvider extends ChangeNotifier{
  Locale _currentLocale = const Locale('ar');
  //Locale _currentLocale = const Locale('en');

  Locale get currentLocal => _currentLocale;

  void changeLocale(){
    if(_currentLocale.languageCode == "ar"){
      _currentLocale = const Locale("en");
    }else{
      _currentLocale = const Locale("ar");
    }
    notifyListeners();
  }
}