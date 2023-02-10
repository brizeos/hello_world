import 'package:flutter/material.dart';
import 'package:hello_world/system/router.dart';
import 'package:openfoodfacts/model/UserAgent.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

void main() {
  offConfiguration();
  runApp(MyApp());
}

void offConfiguration() {
  OpenFoodAPIConfiguration.userAgent = const UserAgent(name: "Brizeos");
  OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
    OpenFoodFactsLanguage.FRENCH
  ];
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: CustomRouter().routes(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }


}
