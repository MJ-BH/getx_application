import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_application/screens/SommePage.dart';

class MainPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPageView();
  }
}

class MainPageView extends StatefulWidget {
  MainPageView({Key key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final TextEditingController emailcontroller = TextEditingController();
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.writeIfNull("email", "test email");
    print(box.read("email"));

    return Scaffold(
      appBar: AppBar(
        title: Text('title'.trArgs([box.read('email').toString()])),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          box.write("email", emailcontroller.text);
          Get.toNamed('/SommePage');
          //Get.to(() => SommePage());
        },
        label: Text('next'.tr),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
        icon: Icon(Icons.arrow_right_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.greenAccent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.tealAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.orange)),
              ),
              onPressed: () {
                GetUtils.isEmail(emailcontroller.text)
                    ? Get.snackbar('Email Correct'.tr, 'Bon Email Format',
                        backgroundColor: Colors.green[900],
                        snackPosition: SnackPosition.BOTTOM)
                    : Get.snackbar('Email incorrect', 'Mauvais Email Format',
                        backgroundColor: Colors.red[800],
                        snackPosition: SnackPosition.TOP);
              },
              child: Text('valide'.tr),
            ),
          ),
          Container(
            width: double.infinity,
            height: 56,
            padding: EdgeInsets.fromLTRB(56, 16, 56, 0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              onPressed: () {
                Get.updateLocale(Locale('fr'));
              },
              label: Text("Changer FR "),
              icon: Icon(Icons.g_translate_outlined),
            ),
          ),
          Container(
            width: double.infinity,
            height: 56,
            padding: EdgeInsets.fromLTRB(56, 16, 56, 0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              onPressed: () {
                Get.updateLocale(Locale('en'));
              },
              label: Text("Changer en "),
              icon: Icon(Icons.g_translate_outlined),
            ),
          ),
          Container(
            width: double.infinity,
            height: 56,
            padding: EdgeInsets.fromLTRB(56, 16, 56, 0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              onPressed: () {
                Get.updateLocale(Locale('ar'));
              },
              label: Text("Changer ar "),
              icon: Icon(Icons.g_translate_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
