import 'dart:collection';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:getx_firebase/models/sqlLiteMyCart/myCart.dart';
import 'package:getx_firebase/screen/homeScreenControl/myCart/payment_processing.dart';

import '../../../controllers/controllers/billController.dart';
import '../../../models/bill.dart';

Widget listItemInCart(MyCartController myCartController, BuildContext context){
  return Container(
    child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child:  ListView.builder(
          itemCount: myCartController.lstMyCart.value?.length,
          itemBuilder: (context, index){
            return Container(
              padding:const EdgeInsets.only(top: 0,bottom: 0),
              decoration: BoxDecoration(
                //color: Colors.red,
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1
                      )
                  )
              ),
              child: Row(
                children: [
                  Expanded(flex:4,child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset('${getPlant(myCartController.lstMyCart.value![index]!.idPlant!)!.image}',height: 100,),
                  ),),
                  Expanded(
                      flex:7,
                      child:  Container(
                        // color: Colors.purple,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children:[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(getPlant(myCartController.lstMyCart.value![index]!.idPlant!)!.name,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa',
                                    ),),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child:  Text('Size • ${getPlant(myCartController.lstMyCart.value![index]!.idPlant!)!.info.size}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      fontFamily: 'Comfortaa',
                                    ),),
                                ),

                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text('${getPlant(myCartController.lstMyCart.value![index]!.idPlant!)!.price}\$',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        myCartController.dbHelper.update(
                                          MyCart(
                                            id: myCartController.lstMyCart.value![index]!.id,
                                              email: myCartController.lstMyCart.value![index]!.email,
                                              idPlant: myCartController.lstMyCart.value![index]!.idPlant,
                                              number: myCartController.lstMyCart.value![index]!.number! - 1)
                                        ).whenComplete(() =>  myCartController.getLstMyCart());

                                      },
                                      child: Icon(Icons.remove_circle_outline,size: 35,color: Colors.grey,),
                                    ),
                                    Text(' ${myCartController.lstMyCart.value![index]!.number} ',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF498552),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Comfortaa',
                                      ),),
                                    InkWell(
                                      onTap: (){
                                        myCartController.dbHelper.update(
                                            MyCart(
                                                id: myCartController.lstMyCart.value![index]!.id,
                                                email: myCartController.lstMyCart.value![index]!.email,
                                                idPlant: myCartController.lstMyCart.value![index]!.idPlant,
                                                number: myCartController.lstMyCart.value![index]!.number! + 1)
                                        ).whenComplete(() =>  myCartController.getLstMyCart());

                                      },
                                      child: Icon(Icons.add_circle_outline,size: 35,color: Colors.grey,),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ))

                ],
              ),
            );
          }),
    ),
  );
}

Widget buttonCheckOut(MyCartController myCartController, UserController userController, BillController billController){
  return Column(
    children: [
      Container(
        padding:const EdgeInsets.only(top: 50,bottom: 20),
        decoration: BoxDecoration(
          //color: Colors.red,
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1
                )
            )
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text('Items',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey
                    ),),
                ),
                Expanded(
                  child: Text('\$ ${bill(myCartController)?.toStringAsFixed(2)}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold
                    ),),
                ),

              ],
            ),
            const SizedBox(height: 5,),
            Row(
              children: const [
                Expanded(
                  child: Text('Discounts',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey
                    ),),
                ),
                Expanded(
                  child: Text('- \$ 0.00',textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                    ),),
                ),

              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 10,),
      Row(
        children: [
          const Expanded(
            child: Text('Total',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: Colors.grey
              ),),
          ),
          Expanded(
            child: Text('\$ ${bill(myCartController)?.toStringAsFixed(2)}',textAlign: TextAlign.right,
              style: const TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold
              ),),
          ),

        ],
      ),

      // button
      Padding(padding: EdgeInsets.all(20),
        child:  ElevatedButton(
            onPressed: (){
              Get.bottomSheet(
               bottomSheetCheckOut(myCartController,userController,billController),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );


            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),

                    )
                )
            ),
            child: const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(child: Text('Checkout',style: TextStyle(
                fontSize: 20,
                fontFamily: 'Comfortaa',
              ),)),
            )),
      ),
    ],
  );
}

Widget bottomSheetCheckOut(MyCartController myCartController, UserController userController, BillController billController){
  return  Container(
    margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
    child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Thanh toán',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              // address
              Container(
                //margin: EdgeInsets.only(top: 20,bottom: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children:[
                        Icon(FontAwesomeIcons.user,size: 15,),
                        Text(' ${userController.user.value!.name}',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                          ),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_phone_outlined,size: 15,),
                        Text(' ${userController.user.value!.phone}',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                          ),),
                      ],
                    ),
                    Row(
                      children:[
                        Icon(Icons.location_on_outlined,size: 15,),
                        Expanded(child:  Text(' ${userController.user.value!.address}'
                          ,overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                          ),),)
                      ],
                    )
                  ],
                ),
              ),

              //payment method
              Container(
                margin: const EdgeInsets.only(top: 20,bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Payment method',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Icon(FontAwesomeIcons.creditCard,size: 40, color: Color(0xFF498552),),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Icon(FontAwesomeIcons.ccMastercard,size: 40,color: Color(0xFFC8DACB)),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Icon(FontAwesomeIcons.ccPaypal,size: 40,color: Color(0xFFC8DACB)),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Icon(FontAwesomeIcons.wallet,size: 40,color: Color(0xFFC8DACB)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              // item
              Container(
                child: Column(
                  children: [
                    Container(
                      padding:const EdgeInsets.only(top: 20,bottom: 20),
                      decoration: BoxDecoration(
                        //color: Colors.red,
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1
                              ),
                              top: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1
                              )
                          )
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text('Items',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey
                                  ),),
                              ),
                              Expanded(
                                child: Text('\$ ${bill(myCartController)?.toStringAsFixed(2)}',
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF498552)
                                  ),),
                              ),

                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: const [
                              Expanded(
                                child: Text('Discounts',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.grey
                                  ),),
                              ),
                              Expanded(
                                child: Text('- \$ 0.00',textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Color(0xFF498552)
                                  ),),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Expanded(
                          child: Text('Total',
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                color: Colors.grey
                            ),),
                        ),
                        Expanded(
                          child: Text('\$ ${bill(myCartController)?.toStringAsFixed(2)}',textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF498552)
                            ),),
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              // button
              Padding(padding: EdgeInsets.all(30),
                child:  ElevatedButton(
                    onPressed: () async {

                      if(userController.user.value!.name == ''
                          || userController.user.value!.address == ''
                          || userController.user.value!.phone == ''
                          || myCartController.lstMyCart.value!.isEmpty){
                        Get.snackbar('Fill in shipping information',
                            'Visit the account page to edit information',
                            snackPosition: SnackPosition.TOP,
                        colorText: Colors.white);
                      }else {
                        // tạo bill
                        billController.createBill(myCartController, userController).whenComplete(()
                        =>  Future.delayed(const Duration(seconds: 1), () {
                          Get.snackbar('Complete purchase', 'Visit your account page to track your order',snackPosition: SnackPosition.TOP,
                              colorText: Colors.black);// Prints after 1 second.
                        })
                        );
                      }

                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),

                            )
                        )
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(child: Text('Checkout',style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Comfortaa',
                      ),)),
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}