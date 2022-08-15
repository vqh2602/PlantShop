
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
import '../../models/plant.dart' as pl;

Widget oderList(String title, BillController billController, UserController userController, MyCartController myCartController){
  return Column(
    children: [
      Text('$title',
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFF498552),
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
        ),),
      Expanded(child: Obx(()=>
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: lstBill(title,billController,userController).length,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(left: 20,right: 20,top: 3,bottom: 3),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
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
                                Text(lstBill(title,billController,userController)[index].money!.toStringAsFixed(3) +' \$',
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
                                const Text('Order date',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),),
                                Text(formatDate(DateTime.parse(lstBill(title,billController,userController)[index].date!), [dd, '-', mm, '-', yyyy]).toString(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa',
                                  ),)
                              ],
                            ),

                            // thoong tin ng dung
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
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
                                                      const Icon(FontAwesomeIcons.user,size: 20,color: Color(0xFF498552),
                                                      ),
                                                      const SizedBox(width: 5,),
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
                                                      const Icon(Icons.local_phone_outlined,size: 20,color: Color(0xFF498552),),
                                                      const SizedBox(width: 5,),
                                                      Text(lstBill(title,billController,userController)[index].address!.phone!,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Comfortaa',
                                                        ),),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      const Icon(Icons.location_on_outlined,size: 20,color: Color(0xFF498552),),
                                                      const SizedBox(width: 5,),
                                                      Expanded(child:  Text(lstBill(title,billController,userController)[index].address!.address!
                                                        ,overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: const TextStyle(
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
                                        child: const Text('Delivery information',
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

                            // danh sach sp
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
                                                  itemCount: lstBill(title,billController,userController)[index].listPlant!.length,
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
                                                            child: Image.asset(getPlant(lstBill(title,billController,userController)[index].listPlant![i]['plant']['plantID'].toString()).image,height: 50,),
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
                                                                      child: Text(getPlant(lstBill(title,billController,userController)[index].listPlant![i]['plant']['plantID'].toString()).name,
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
                                                                        Text('${getPlant(lstBill(title,billController,userController)[index].listPlant![i]['plant']['plantID'].toString()).price}\$',
                                                                          style: const TextStyle(
                                                                            fontSize: 10,
                                                                            color: Color(0xFF498552),
                                                                            fontWeight: FontWeight.bold,
                                                                            fontFamily: 'Comfortaa',
                                                                          ),),
                                                                        Align(
                                                                          alignment: Alignment.bottomRight,
                                                                          child: Text( 'x' + lstBill(title,billController,userController)[index].listPlant![i]['plant']['number'].toString(),
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
                                                        title: const Text('Do you want to cancel the order?'),
                                                        content: const Text('This will result in your order not being delivered'),
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
                                                        billController.getBill();
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
                                                      child: const Text(
                                                        'Order cancellation',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: 'Comfortaa',
                                                        ),
                                                      )),
                                                )
                                            ):const SizedBox(),
                                            ExpandableButton(       // <-- Collapses when tapped on
                                              child: const Icon(Icons.keyboard_arrow_up,color: Color(0xFF498552),),
                                            ),
                                          ]
                                      ),
                                      collapsed:ExpandableButton(  // <-- Expands when tapped on the cover photo
                                        child: const Text('Purchased product', style: TextStyle(
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



pl.Plant getPlant(String idPlant){
 late pl.Plant plant;
 // print('so luong tach: ${listSanPham.length}');
  // loại bỏ phẩn tử thừa , ở cuối cùng
  for(var x in lstPlant){
    if(x.id == int.parse(idPlant)){
      plant = x;
    }
    // print('${lstSl[0]} so luong: ${lstSl[1]}');
  }


  return plant;
}




// List<Plant> lstPlantBuy(List<String> lstGetSp){
//   List<Plant> lst =[];
//   for(var getsp in lstGetSp){
//     for(var pl in lstPlant){
//       if(int.parse(getsp[0]) == pl.id){
//         print(getsp[0]);
//         lst.add(pl);
//       }
//     }
//   }
//   return lst;
// }