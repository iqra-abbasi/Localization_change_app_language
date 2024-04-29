import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/language_change_controller.dart';
import 'Views/HomeScreen/home_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp=await SharedPreferences.getInstance();
  final String languageCode=sp.getString('language_code') ?? '';

  runApp(
    MultiProvider(providers: [
ChangeNotifierProvider(create: (context) => LanguageChangeController(),)
    ],
    child: MyApp(locale: languageCode,),
    )
  );
}

class MyApp extends StatelessWidget {
  final String locale;

  MyApp({super.key,required this.locale});

  @override
  Widget build(BuildContext context) {

    return Consumer<LanguageChangeController>(builder: (context,provider, child) {

    if(locale.isEmpty){
      provider.changeLanguage(Locale('en'));
    }
      return  MaterialApp(

        //locale: Locale('es'),
        locale:locale == '' ? Locale('en') :provider.applocal == null ? Locale('en'):provider.applocal,
        debugShowCheckedModeBanner: false,

        home: HomePageScreen(),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,

        ],
        supportedLocales: [
          Locale('en'),
          Locale('es'),
          Locale('ur'),
        ],
      );

    },);
  }
}
