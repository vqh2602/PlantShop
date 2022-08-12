import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';

import '../../models/bill.dart';
import '../../screen/homeScreenControl/myCart/payment_processing.dart';

class BillController extends GetxController{
  Rx<List<Bill>> lstBill = Rx<List<Bill>>([]);

  late DatabaseReference _db;
  late FirebaseDatabase database;
  // _db = FirebaseDatabase(
  //     app: await Firebase.initializeApp(),
  //     databaseURL: 'https://woolha-fa3d2.firebaseio.com'
  // ).reference();


  Future<void> createBill(MyCartController myCartController, UserController userController) async {

    database= FirebaseDatabase.instanceFor(
        app: await Firebase.initializeApp(),
        databaseURL: 'https://getxfirebase-34c80-default-rtdb.asia-southeast1.firebasedatabase.app');

    //database= FirebaseDatabase.instanceFor(app: await Firebase.initializeApp());
    DatabaseReference ref = database.ref('Bill');

    // chuyển dánh ách giỏ hàng thành chuỗi chuyên biệt
    String lstPlant = '';
    for(var lst in myCartController.lstMyCart.value!){
    lstPlant+= '${lst!.idPlant}:${lst.number},';
    }
    // Map<String, Object> map =  HashMap<>() as Map<String, Object>;

    //    await ref.set({
    //   "maHD": "Plantshop-2022-101",
    //   "address": {
    //     "name":userController.user.value!.name,
    //     "phone": userController.user.value!.phone,
    //     "address": userController.user.value!.address,
    //   },
    //   "listPlant": {
    //        "lst1": {
    //          "id": 9,
    //          "num": 20,
    //        }
    //   },
    //     // "plant":9,
    //     // "number": 12
    //
    //   "money":2000,
    //   "sale": 0,
    //   "date": "20/08/2017",
    //   "status": "processing"
    // });
    // final ref = FirebaseDatabase.instance.ref();

    final snapshotBillId = await ref.child('idLastBill/idLastBill').get();
    if (snapshotBillId.exists) {
    print(snapshotBillId.value);

    // thêm hoá đơn
    DatabaseReference ref1 = database.ref('Bill/${userController.user.value!.id}/${snapshotBillId.value.toString()}');
    await ref1.set({
    "maHD": int.parse(snapshotBillId.value.toString()),
    "address": {
    "name":userController.user.value!.name,
    "phone": userController.user.value!.phone,
    "address": userController.user.value!.address,
    },
    "listPlant": lstPlant,
    // "plant":9,
    // "number": 12

    "money":bill(myCartController),
    "sale": 0,
    "date":DateTime.now().toString(),
    "status": "processing"
    }).whenComplete(() async {
    //update lại lastid hoá đơn
    DatabaseReference ref3 =ref.child("idLastBill");

    // Only update the name, leave the age and address!
    await ref3.update({
    "idLastBill": int.parse(snapshotBillId.value.toString())+1,
    });
    }).whenComplete((){
      //print('update lastidbill')
      // mua hoàn tất xoá sản phẩm có trong giỏ hàng
      for(var cart in myCartController.lstMyCart.value!){
        myCartController.dbHelper.delete(userController.user.value!.email, cart!.idPlant!);
      }
      myCartController.getLstMyCart().whenComplete(() =>  Get.back());
     
    });
    } else {
    print('No data available.');
    }
  }

  Future<void> getBill(MyCartController myCartController, UserController userController) async {
    database= FirebaseDatabase.instanceFor(
        app: await Firebase.initializeApp(),
    databaseURL: 'https://getxfirebase-34c80-default-rtdb.asia-southeast1.firebasedatabase.app');

    //database= FirebaseDatabase.instanceFor(app: await Firebase.initializeApp());
    DatabaseReference ref = database.ref('Bill');

    final snapshot = await ref.child('${userController.user.value!.id}').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    List<Bill> lstB = [];
    map.forEach((key, value) {
      print(value);
      final bill = Bill.fromJson(value);
      //
     lstB.add(bill);
      // list.add(user);
    });
    lstBill.value = lstB;
  }

  Future<void> updateBill(int userId, int billId ) async {

    database= FirebaseDatabase.instanceFor(
        app: await Firebase.initializeApp(),
        databaseURL: 'https://getxfirebase-34c80-default-rtdb.asia-southeast1.firebasedatabase.app');

    //database= FirebaseDatabase.instanceFor(app: await Firebase.initializeApp());
    DatabaseReference ref = database.ref('Bill');

    DatabaseReference ref3 =ref.child("$userId/$billId");

    // Only update the name, leave the age and address!
    await ref3.update({
      "status": "canceled",
    }).whenComplete(() => Get.snackbar('Order cancel successfully', 'Visit your account page to track your order',snackPosition: SnackPosition.TOP,
        colorText: Colors.black));

  }
}