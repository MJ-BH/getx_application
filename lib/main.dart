import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_application/screens/mainPage.dart';
import 'package:getx_application/utils/MyTranslation.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //  locale: Locale('FR'),
    locale: Get.deviceLocale,
    translations: MyTranslations(),
    initialRoute: '/mainPage',
    theme: ThemeData(accentColor: Colors.teal, primaryColor: Colors.blueAccent),
    darkTheme: ThemeData(
        accentColor: Colors.red, primaryColor: Colors.purpleAccent[200]),
    defaultTransition: Transition.downToUp,
    getPages: [GetPage(name: '/mainPage', page: () => MainPAge())],
  ));
}
