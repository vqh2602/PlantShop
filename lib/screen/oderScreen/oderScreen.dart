
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/billController.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';

import '../../controllers/controllers/userController.dart';
import 'oderScreen_widget.dart';

class OderScreen extends StatelessWidget{
String title;

  BillController billController = Get.put(BillController());
  MyCartController myCartController = Get.put(MyCartController());
  UserController userController = Get.put(UserController());

  OderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // billController.getBill(myCartController, userController);

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          // child: SizedBox(),
          child: oderList(title,billController,userController,myCartController),
        ),
      ),
    );
  }

}