import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Providers/language_change_controller.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

enum Language{english,urdu,spanish}


class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        centerTitle: true,

        actions: [
      Consumer<LanguageChangeController>(builder: (context, provider, child) {
        return   PopupMenuButton(
            onSelected: (Language item){
              if(Language.english.name==item.name){
                print('english');
                provider.changeLanguage(Locale('en'));

              }
              else if(Language.urdu.name==item.name){
                print('urdu');
                provider.changeLanguage(Locale('ur'));
              }
              else{
                print('spanish');
                provider.changeLanguage(Locale('es'));
              }

            },

            itemBuilder: (context) => <PopupMenuEntry<Language>>[
              PopupMenuItem(
                  value: Language.english,
                  child:Text('English')),
              PopupMenuItem(
                  value: Language.urdu,
                  child:Text('urdu')),

              PopupMenuItem(
                  value: Language.spanish,
                  child:Text('Spanish')),



            ]);

      },)

        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.local),

          ],
        ),
      ),

    );
  }
}
