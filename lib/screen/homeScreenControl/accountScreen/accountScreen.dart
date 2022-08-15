import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:getx_firebase/main.dart';
import 'package:getx_firebase/screen/infoPlantScreen/infoPlantScreen.dart';
import 'package:getx_firebase/screen/oderScreen/oderScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/controllers/billController.dart';
import '../../../controllers/controllers/myCartController.dart';
import '../../../data/plantData.dart';
import '../../../models/bill.dart';
import '../../../models/plant.dart';
import '../../oderScreen/oderScreen_widget.dart';
import '../../splashScreen/splashScreen.dart';
import 'accountScreen_widget.dart';
import 'editAccInfomationScreen.dart';

class AccountScreen extends GetWidget{
 AccountScreen({Key? key}) : super(key: key);

  AuthController authController = Get.put(AuthController());
  UserController userController = Get.put(UserController());
  BillController billController = Get.put(BillController());
  MyCartController myCartController =  Get.put(MyCartController());


  @override
  Widget build(BuildContext context) {
    billController.onInit();
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body:Container(
        color: const Color(0xFFf7f7f7),
        child: Column(
          children: [
            // thông tin người dùng + đơn hàng
            Expanded(
                flex: 4,
                child: infoAcc(userController,authController)),

            // danh sach 10 sản phẩm đã mua gần nhất
            Expanded(
                flex: 5,
                child: purchaseOderAndOder(billController,userController,myCartController)),
          ],
        ),
      ),
    );
  }


}