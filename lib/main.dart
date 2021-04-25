import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_application/controllers/Sommebind.dart';
import 'package:getx_application/screens/SommePage.dart';
import 'package:getx_application/screens/mainPage.dart';
import 'package:getx_application/utils/MyTranslation.dart';

void main() async {
  await GetStorage.init();
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
    getPages: [
      GetPage(name: '/mainPage', page: () => MainPAge()),
      GetPage(name: '/SommePage', page: () => SommePage(), binding: SommeBind())
    ],
  ));
}
