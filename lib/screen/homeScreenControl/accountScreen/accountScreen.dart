
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';

import '../../../controllers/controllers/billController.dart';
import '../../../controllers/controllers/myCartController.dart';
import 'accountScreen_widget.dart';

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