import 'package:date_format/date_format.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/billController.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/data/plantData.dart';

import '../../controllers/controllers/authController.dart';
import '../../controllers/controllers/userController.dart';
import '../../models/bill.dart';
import '../../models/plant.dart';
import 'oderScreen_widget.dart';

class OderScreen extends StatelessWidget{
String title;

  BillController billController = Get.put(BillController());
  MyCartController myCartController = Get.put(MyCartController());
  UserController userController = Get.put(UserController());

  OderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    billController.getBill(myCartController, userController);

    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: oderList(title,billController,userController,myCartController),
        ),
      ),
    );
  }

}