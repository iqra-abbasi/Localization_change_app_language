import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController extends ChangeNotifier{

  Locale? _applocale;
  Locale? get applocal => _applocale;

  void changeLanguage(Locale type)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    _applocale=type;

if(type==Locale('en')){
await sp.setString('language_code','en');
}
else if (type==Locale('ur')){
  await sp.setString('language_code','ur');
}
else{
  await sp.setString('language_code','es');
    }
    notifyListeners();
}



}