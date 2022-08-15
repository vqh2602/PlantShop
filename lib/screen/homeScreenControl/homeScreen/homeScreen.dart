

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/homeControler.dart';
import 'package:getx_firebase/data/plantData.dart';
import 'package:sizer/sizer.dart';

import 'home_widget.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeControl = Get.put(HomeController());
    TextEditingController _textEdittingControllerSearch = TextEditingController();
    List<String> lstTitleControl =[
      'All',
      'Outdoors',
      'Indoors',
      'Gardens',
      'Lakes'
    ];
    int selectTitleControl = 0;


    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      backgroundColor: Color(0xFFf7f7f7),
      body: SafeArea(
        child: SizedBox(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                // search
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: homeSearch(_textEdittingControllerSearch),
                ),
                // Title control
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  child: homeTitle(lstTitleControl, _homeControl),
                ),
               Expanded(child: Obx(()=>SingleChildScrollView(
                 child: Column(
                   children: [
                     //Plant Offer
                     Container(
                       height: 38.h,
                       margin: const EdgeInsets.only(top: 20),
                       child: homePlantOffer(lstTitleControl[_homeControl.selectTitleControl.value]),
                     ),
                     //Featured Plants
                     Container(
                       child: homePlantFeatured(lstTitleControl[_homeControl.selectTitleControl.value]),
                     ),
                     const SizedBox(
                       height: 20,
                     )
                   ],
                 ),
               )))
              ],
            ),
          ),
        ),
      ),
    );
  }

}