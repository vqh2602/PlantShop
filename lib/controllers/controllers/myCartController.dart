import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/models/sqlLiteMyCart/dbHelper.dart';
import 'package:getx_firebase/models/sqlLiteMyCart/myCart.dart';

class MyCartController extends GetxController{
  Rx<List<MyCart?>?> lstMyCart = Rx<List<MyCart?>?>(null);

  DBHelper dbHelper = DBHelper();
  AuthController authController = Get.find();

  Future<List<MyCart>> getLstMyCart() async {
    // Obtain shared preferences.
   // final prefs = await SharedPreferences.getInstance();
    lstMyCart.value = await dbHelper.getDataMyCart(authController.user!);
    print(lstMyCart.value!.length);
    return await dbHelper.getDataMyCart(authController.user!);
  }

  Future<void> createLstMyCart(int id, int number) async {
    MyCart myCart1 = MyCart(email: authController.user, idPlant: id, number: number);
    if(await dbHelper.checkPlantInMyCart(authController.user!, id)){
      Get.snackbar('Sản phẩm có sẵn trong giỏ hàng', 'vào giỏ hàng để cập nhật số lượng');
    }else{
      dbHelper.save(myCart1);
      Get.snackbar('Đã thêm vào giỏ hàng', 'Vào giỏ hàng để kiểm tra');
    }
    //List<MyCart> list = [myCart1,myCart2,m];

    getLstMyCart();
  }

  updateLstMyCart(int id,int number){

  }
}