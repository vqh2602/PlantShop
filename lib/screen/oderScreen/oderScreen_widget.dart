
import 'package:date_format/date_format.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/billController.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';

import '../../data/plantData.dart';
import '../../models/bill.dart';
import '../../models/plant.dart';

Widget oderList(String title, BillController billController, UserController userController, MyCartController myCartController){
  return Column(
    children: [
      Text('$title',
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFF498552),
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
        ),),
      Expanded(child: Obx(()=>
          Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: lstBill(title,billController,userController).length,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 3,bottom: 3),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Order number',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),),
                                Text(lstBill(title,billController,userController)[index].maHD.toString(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Payments',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),),
                                Text(lstBill(title,billController,userController)[index].money.toString() +' \$',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF498552),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Order date',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),),
                                Text(formatDate(DateTime.parse(lstBill(title,billController,userController)[index].date!), [dd, '-', mm, '-', yyyy]).toString(),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),)
                              ],
                            ),

                            // thoong tin ng dung
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide( //                    <--- top side
                                    color: Color(0xFF498552),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: ExpandableNotifier(  // <-- Provides ExpandableController to its children
                                child: ScrollOnExpand(        // <-- Wraps the widget to scroll
                                    child: ExpandablePanel(
                                      expanded:Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children:[
                                                      Icon(FontAwesomeIcons.user,size: 20,color: Color(0xFF498552),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(lstBill(title,billController,userController)[index].address!.name!,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Comfortaa',
                                                        ),),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20,),
                                                  Row(
                                                    children:[
                                                      Icon(Icons.local_phone_outlined,size: 20,color: Color(0xFF498552),),
                                                      SizedBox(width: 5,),
                                                      Text(lstBill(title,billController,userController)[index].address!.phone!,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Comfortaa',
                                                        ),),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.location_on_outlined,size: 20,color: Color(0xFF498552),),
                                                      SizedBox(width: 5,),
                                                      Expanded(child:  Text(lstBill(title,billController,userController)[index].address!.address!
                                                        ,overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Comfortaa',
                                                        ),),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            ExpandableButton(       // <-- Collapses when tapped on
                                              child: Icon(Icons.keyboard_arrow_up,color: Colors.black,),
                                            ),
                                          ]
                                      ),
                                      collapsed:ExpandableButton(  // <-- Expands when tapped on the cover photo
                                        child: Text('Delivery information',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Comfortaa',
                                          ),),    // <-- Your Expandable or ExpandablePanel
                                      ),
                                    )
                                ),),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide( //                    <--- top side
                                    color: Color(0xFF498552),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child:ExpandableNotifier(  // <-- Provides ExpandableController to its children
                                child: ScrollOnExpand(        // <-- Wraps the widget to scroll
                                    child: ExpandablePanel(
                                      expanded:Column(
                                          children: [
                                            SizedBox(
                                              height: 200,
                                              child: ListView.builder(
                                                  itemCount: lstPlantBuy(getsp(lstBill(title,billController,userController)[index].listPlant!)).length,
                                                  itemBuilder: (context,i){
                                                    return Container(
                                                      margin:const EdgeInsets.only(left: 20,right: 20),
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
                                                            child: Image.asset('${lstPlantBuy(getsp(lstBill(title,billController,userController)[index].listPlant!))[i].image}',height: 50,),
                                                          ),),
                                                          Expanded(
                                                              flex:7,
                                                              child:  Container(
                                                                // color: Colors.purple,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [

                                                                    Align(
                                                                      alignment: Alignment.topLeft,
                                                                      child: Text(lstPlantBuy(getsp(lstBill(title,billController,userController)[index].listPlant!))[i].name,
                                                                        style: const TextStyle(
                                                                          fontSize: 13,
                                                                          color: Colors.black,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontFamily: 'Comfortaa',
                                                                        ),),
                                                                    ),

                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text('${lstPlantBuy(getsp(lstBill(title,billController,userController)[index].listPlant!))[i].price}\$',
                                                                          style: const TextStyle(
                                                                            fontSize: 10,
                                                                            color: Color(0xFF498552),
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: 'Comfortaa',
                                                                          ),),
                                                                        Align(
                                                                          alignment: Alignment.bottomRight,
                                                                          child: Text( 'x' + getsoluong(lstBill(title,billController,userController)[index].listPlant!)[i],
                                                                            style: const TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: 'Comfortaa',
                                                                            ),),
                                                                        ),
                                                                      ],
                                                                    ),

                                                                  ],
                                                                ),
                                                              ))

                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),

                                            title=="Processing"?Align(
                                                alignment: Alignment.centerRight,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    var x = await Get.dialog(
                                                      AlertDialog(
                                                        title: const Text('you want to change?'),
                                                        content: const Text('this will change your data!'),
                                                        actions: [
                                                          TextButton(
                                                            child: const Text("Close"),
                                                            onPressed: () => Get.back(result: false),
                                                          ),
                                                          TextButton(
                                                            child: const Text("Save"),
                                                            onPressed: () => Get.back(result: true),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                    if(x){
                                                      billController.updateBill(int.parse(userController.user.value!.id.toString()),int.parse(lstBill(title,billController,userController)[index].maHD!.toString()) );
                                                      Future.delayed(const Duration(seconds: 1), () {
                                                        billController.getBill(myCartController, userController);
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      decoration: const BoxDecoration(
                                                          gradient: LinearGradient(
                                                            colors: <Color>[
                                                              Color(0xFFC8DACB),
                                                              Color(0xFF64976C),
                                                              Color(0xFF80AA86),
                                                            ],
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                                      ),
                                                      child: Text(
                                                        'Order cancellation',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: 'Comfortaa',
                                                        ),
                                                      )),
                                                )
                                            ):SizedBox(),
                                            ExpandableButton(       // <-- Collapses when tapped on
                                              child: Icon(Icons.keyboard_arrow_up,color: Color(0xFF498552),),
                                            ),
                                          ]
                                      ),
                                      collapsed:ExpandableButton(  // <-- Expands when tapped on the cover photo
                                        child: Text('Purchased product', style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa',
                                        ),),    // <-- Your Expandable or ExpandablePanel
                                      ),
                                    )
                                ),),
                            ),


                          ],
                        ),
                      ),
                    ),
                  );
                },
              ))))
    ],
  );
}



List<Bill> lstBill (String title,BillController billController, UserController userController){
  List<Bill> lst = [];
  for(var plant in billController.lstBill.value){
    if(plant.status == title.toLowerCase()){
      lst.add(plant);
    }
  }
  lst.sort((a, b) {
    var aDate = a.maHD;
    var bDate = b.maHD;
    return bDate!.compareTo(aDate!);
  });
  return lst;
}

List<String> getsp(String lstBill){
  List<String> lstSl = [];
  var listSanPham =lstBill.split(',');
  print('so luong tach: ${listSanPham.length}');
  // loại bỏ phẩn tử thừa , ở cuối cùng
  for(int i=0; i<listSanPham.length-1;i++){
    var x = listSanPham[i].split(':');
    lstSl.add(x[0]);
    // print('${lstSl[0]} so luong: ${lstSl[1]}');
  }
  // for(var lst in lstBill()){
  //   var listSanPham = lst.listPlant!.split(',');
  //   print('so luong tach: ${listSanPham.length}');
  //   // loại bỏ phẩn tử thừa , ở cuối cùng
  //   for(int i=0; i<listSanPham.length-1;i++){
  //     lstSl = listSanPham[i].split(':');
  //     // print('${lstSl[0]} so luong: ${lstSl[1]}');
  //   }
  // }
  print(lstSl.toString());
  return lstSl;
}

List<String> getsoluong(String lstBill){
  List<String> lstSl = [];
  var listSanPham =lstBill.split(',');
  print('so luong tach: ${listSanPham.length}');
  // loại bỏ phẩn tử thừa , ở cuối cùng
  for(int i=0; i<listSanPham.length-1;i++){
    var x = listSanPham[i].split(':');
    lstSl.add(x[1]);
    // print('${lstSl[0]} so luong: ${lstSl[1]}');
  }


  return lstSl;
}

List<Plant> lstPlantBuy(List<String> lstGetSp){
  List<Plant> lst =[];
  for(var getsp in lstGetSp){
    for(var pl in lstPlant){
      if(int.parse(getsp[0]) == pl.id){
        print(getsp[0]);
        lst.add(pl);
      }
    }
  }
  return lst;
}