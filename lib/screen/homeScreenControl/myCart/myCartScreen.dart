import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/billController.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myCart_widget.dart';

class MyCartScreen extends StatelessWidget{

  MyCartController myCartController = Get.put(MyCartController());
  BillController billController = Get.put(BillController());
  UserController userController = Get.find();

  MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
          height: double.infinity,
          width: double.infinity,
          child: FutureBuilder(
            future: myCartController.getLstMyCart(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData){
                return Obx(()=>
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Align(
                            child: Text(
                              "My Cart",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),

                          // list item
                          Expanded(
                              flex: 5,
                              child:listItemInCart(myCartController,context)),
                          // button
                          Expanded(
                              flex: 3,
                              child: buttonCheckOut(myCartController,userController,billController))
                        ],
                      ),
                    ));
              }
              else if(snapshot.hasError){
                return Center(
                  child: Container(
                    width: 100,height: 100,
                    padding: const EdgeInsets.all(20),
                    child: const CircularProgressIndicator(),),
                );
              }else{
                return Center(
                  child: Container(
                    width: 100,height: 100,
                    padding: const EdgeInsets.all(20),
                    child: const CircularProgressIndicator(),),
                );
              }

            },

          ),
        ),
      ),
    );
  }
  
}