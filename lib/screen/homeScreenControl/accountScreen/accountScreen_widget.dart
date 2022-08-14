
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/controllers/controllers/billController.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:sizer/sizer.dart';

import '../../../data/plantData.dart';
import '../../../main.dart';
import '../../../models/bill.dart';
import '../../../models/plant.dart';
import '../../infoPlantScreen/infoPlantScreen.dart';
import '../../oderScreen/oderScreen.dart';
import '../../oderScreen/oderScreen_widget.dart';
import '../../splashScreen/splashScreen.dart';
import 'editAccInfomationScreen.dart';

Widget infoAcc(UserController userController, AuthController authController){
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      // image: DecorationImage(
      //     image: AssetImage('assets/images/bg.jpg',),
      //   fit: BoxFit.fill
      // ),
      color: Color(0xFF64976C),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(75)
      ),
    ),
    child: SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child:Container(
                    decoration: BoxDecoration(
                      //color: Colors.red,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1
                            )
                        )
                    ),
                    child:  Obx(()=>
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage('assets/images/user1.jpg'),
                              radius: 7.h,
                            ),
                            Expanded(child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child:
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(userController.user.value!.email,
                                          style:TextStyle(
                                              fontFamily: 'Comfortaa',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      )),
                                  const SizedBox(height: 5,),
                                  Expanded(flex:1,
                                      child:  Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          onTap: () async {
                                            var x = await Get.to(const EditAccInformationScreen());
                                            if(x==null){
                                              // rest lại page, reset lại giá trị mới
                                              pageController.jumpToPage(4);
                                            }
                                          },
                                          child: const Text('edit account infomation >',
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 12,
                                                color: Color(0xFFE9F0EA)
                                            ),),
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: (){
                                          authController.logout();
                                          Get.offAll(const SplashScreen());
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(Icons.logout_outlined,color: Colors.white,),
                                            Text('Logout',style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Comfortaa',
                                            ),)
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ))
                )),
            const SizedBox(height: 15,),
            Expanded(child:
            Column(
              children: [
                Row(
                  children:[
                    const Icon(FontAwesomeIcons.user,size: 20,color: Colors.white,),
                    const SizedBox(width: 5,),
                    Text(userController.user.value!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comfortaa',
                      ),),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children:[
                    const Icon(Icons.local_phone_outlined,size: 20,color: Colors.white,),
                    const SizedBox(width: 5,),
                    Text(userController.user.value!.phone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comfortaa',
                      ),),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,size: 20,color: Colors.white,),
                    const SizedBox(width: 5,),
                    Expanded(child:  Text(userController.user.value!.address
                      ,overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comfortaa',
                      ),),)
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    ),
  );
}

Widget purchaseOderAndOder(UserController userController, BillController billController, MyCartController myCartController){
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 30),
          padding: const EdgeInsets.only(bottom: 20,top: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFf7f7f7),
            border: Border(
              bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1
              ),),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oder',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp
                ),),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(OderScreen(title: "Processing",));
                      // BillController billController = Get.put(BillController());
                      // MyCartController myCartController = Get.put(MyCartController());
                      // billController.getBill(myCartController, userController);
                    },
                    child: Column(
                      children:[
                        Icon(FontAwesomeIcons.receipt,size: 13.w, color: const Color(0xFF498552)),
                        const SizedBox(height: 5,),
                        const Text('Processing',
                          style:TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 10
                          ),)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(OderScreen(title: "Delivering",));
                    },
                    child: Column(
                      children:[
                        Icon(FontAwesomeIcons.cartFlatbed,size: 13.w,color: const Color(0xFF498552)),
                        const SizedBox(height: 5,),
                        const Text('Delivering',
                          style:TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 10
                          ),)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(OderScreen(title: "Complete",));
                    },
                    child: Column(
                      children:[
                        Icon(FontAwesomeIcons.box,size: 13.w,color: const Color(0xFF498552)),
                        const SizedBox(height: 5,),
                        const Text('Complete',
                          style:TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 10
                          ),)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(OderScreen(title: "Canceled",));
                    },
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.rotate,size: 13.w,color: const Color(0xFF498552)),
                        const SizedBox(height: 5,),
                        const Text('Canceled',
                          style:TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 10
                          ),)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 30),
          padding: const EdgeInsets.only(bottom: 20,top: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFf7f7f7),
            border: Border(
              bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1
              ),),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Purchase oder',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp
                  ),),
                const SizedBox(height: 20,),
                SizedBox(
                  //height: 150,
                  height: 16.h,
                  child:
                  Obx(() {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getLstPlantBuy(lstBill(
                            'complete', billController,
                            userController)).length > 10
                            ? 10
                            : getLstPlantBuy(lstBill(
                            'complete', billController,
                            userController)).length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 11.h,
                            height: 11.h,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(InfoPlantScreen(
                                      plant: getLstPlantBuy(
                                          lstBill('complete',
                                              billController,
                                              userController))[index],));
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(getLstPlantBuy(
                                          lstBill('complete',
                                              billController,
                                              userController))[index]
                                          .image, width: 100,
                                        height: 100,),
                                      const SizedBox(height: 5,),
                                      Text('${getLstPlantBuy(
                                          lstBill('complete',
                                              billController,
                                              userController))[index]
                                          .price}\$',
                                        overflow: TextOverflow
                                            .ellipsis,
                                        style: const TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 10,
                                            color: Color(
                                                0xFF498552)
                                        ),),
                                      Text(getLstPlantBuy(lstBill(
                                          'complete',
                                          billController,
                                          userController))[index]
                                          .name,
                                        overflow: TextOverflow
                                            .ellipsis,
                                        style: const TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 10,
                                            color: Colors.grey
                                        ),),

                                    ],
                                  ),
                                )),

                          );
                        });
                  }
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

List<Plant> getLstPlantBuy(List<Bill> lstBill){
  List<Plant> lst = [];
  // print('so luong tach: ${listSanPham.length}');
  // loại bỏ phẩn tử thừa , ở cuối cùng
  for(var b in lstBill){
    for (var lstbpl in b.listPlant!){
      for(var x in lstPlant){
        if(x.id == int.parse(lstbpl['plant']['plantID'].toString())){
          lst.add(x);
        }
        // print('${lstSl[0]} so luong: ${lstSl[1]}');
      }
    }
  }

  return lst;
}