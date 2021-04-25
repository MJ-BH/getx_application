import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
