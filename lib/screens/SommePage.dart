import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_application/controllers/SommeController.dart';
import 'package:getx_application/screens/mainPage.dart';

class SommePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SommePageView();
  }
}

class SommePageView extends StatefulWidget {
  SommePageView({Key key}) : super(key: key);

  @override
  _SommePageViewState createState() => _SommePageViewState();
}

class _SommePageViewState extends State<SommePageView> {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(box.read("email").toString())),
            GetX<SommeController>(
              builder: (_) {
                return Center(
                  child: Text(
                    'Counter 1 :  ${_.cont1}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            GetX<SommeController>(builder: (_) {
              return Center(
                child: Text(
                  'Counter 2 :  ${_.cont2}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            }),
            ElevatedButton.icon(
                onPressed: () {
                  Get.find<SommeController>().increment();
                },
                icon: Icon(Icons.plus_one_outlined),
                label: Text('Ajouter 1')),
            ElevatedButton.icon(
                onPressed: () {
                  Get.find<SommeController>().increment2();
                },
                icon: Icon(Icons.plus_one_outlined),
                label: Text('Ajouter 1')),
            GetX<SommeController>(builder: (_) {
              return Center(
                child: Text(
                  'Somme :  ${_.sum}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            }),
            ElevatedButton.icon(
                onPressed: () {
                  Get.off(MainPAge());
                  //Get.offAll(MainPAge());
                },
                icon: Icon(Icons.arrow_left_rounded),
                label: Text('back'.tr)),
          ],
        ),
      ),
    );
  }
}
