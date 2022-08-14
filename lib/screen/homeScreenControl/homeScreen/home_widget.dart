import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_firebase/controllers/controllers/homeControler.dart';
import 'package:getx_firebase/screen/infoPlantScreen/infoPlantScreen.dart';
import 'package:getx_firebase/screen/searchScreen/searchScreen.dart';
import 'package:sizer/sizer.dart';

import '../../../data/plantData.dart';
import '../../../main.dart';
import '../popularPlant/popularPlantScreen.dart';

Widget homeSearch(TextEditingController textEdittingControllerSearch){
  return Row(
    children: [
      Expanded(
          flex:10,
          child: InkWell(
              onTap: ()=>Get.to(SearchScreen()),
            child: TextField(
              controller: textEdittingControllerSearch,
              enabled: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,size: 7.w,color: const Color(0xFF498552),),
                  hintText: 'Search',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFF498552), width: 1)),
                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFF498552), width: 1)),
                  fillColor: Colors.white,
                  filled: true
              ),
            )),
          ),
      Expanded(
          flex: 2,
          child: InkWell(
            onTap: (){
              print('textsearch: ${textEdittingControllerSearch.text}');
            },
            child:Align(
              alignment: Alignment.centerRight,
              child:  Icon(Icons.notifications_none_sharp, color: const Color(0xFF498552),size: 10.w,),
            ),
          ))
    ],
  );
}

Widget homeTitle(List<String> lstTitleControl, HomeController _homeControl){
  return  ListView.builder(
    itemCount: lstTitleControl.length,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
      return Obx(()  =>
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 10),
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:_homeControl.selectTitleControl.value==index? const Color(0xFF498552): Colors.transparent,
            ),
            child: Center(
              child: InkWell(
                onTap: (){
                  _homeControl.selectTitleControl.value = index;
                },
                child: Text(lstTitleControl[index], style: TextStyle(
                  color: (_homeControl.selectTitleControl.value == index) ? Colors.white: Colors.grey,
                  fontFamily: 'Comfortaa',
                ),),
              ),
            ),
          ));
    },
  );
}

Widget homePlantOffer(String lable){
  return ListView.builder(

      itemCount:  lstPlantSmall(lable).length>10?10:lstPlantSmall(lable).length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index){
        return Container(
         // color: Colors.purple,
          // width: 250,
          // height: 300,
          width: 55.w,
          //height: 3.h,
          margin: const EdgeInsets.only(left: 20),
          child: Stack(
            children: [
              Align(
                child: Container(
                  width: 54.h,
                  height: 30.h,
                  //padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE9F0EA),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10, top: 50,bottom: 20,right: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          color: Color(0xFFC8DACB),
                        ),
                        child: Text( lstPlantSmall(lable)[index].name,
                          style: TextStyle(
                              color: Color(0xFF498552),
                              fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            fontFamily: 'Comfortaa',
                          ),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10,right: 10),
                        child: Text( lstPlantSmall(lable)[index].title, maxLines: 3,overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.grey,
                            fontFamily: 'Comfortaa',
                          ),),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10,right: 10, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${ lstPlantSmall(lable)[index].price} \$',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  fontSize: 11.sp,
                                  fontFamily: 'Comfortaa',
                                ),),
                              ElevatedButton(
                                  child: Icon(
                                      Icons.add,
                                    size: 7.w,
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF498552)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                          )
                                      )
                                  ),
                                  onPressed: (){
                                    Get.to(InfoPlantScreen(plant:  lstPlantSmall(lable)[index],));
                                  }
                              )
                            ],
                          )
                      )

                    ],
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
              Align(
                child: Image.asset( lstPlantSmall(lable)[index].image,height:30.w,),
                alignment: Alignment.topRight,
              ),

            ],
          ),
        );
      });
}

Widget homePlantFeatured(String lable){
  return Column(
    children: [
      //title
      Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Featured Plants',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa',
                  fontSize: 15.sp
              ),),
            InkWell(
              onTap: (){
                pageController.jumpToPage(1);
              },
              child: const Text('View all',style:
              TextStyle(
                  color: Color(0xFF498552),
                fontFamily: 'Comfortaa',
              ),),
            )
          ],
        ),
      ),

      Container(
        height: 300,
        margin: const EdgeInsets.only(left: 20,right: 20,top: 20),

        child: ListView.builder(
            itemCount:  lstPlantBigAndMedium(lable).length>10?10: lstPlantBigAndMedium(lable).length,
            itemBuilder: (context, index){
              return Container(
                //color: Colors.purple,
                height: 21.h,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFE9F0EA),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex:3,
                      child: Image.asset(lstPlantBigAndMedium(lable)[index].image,height:36.w),),
                    Expanded(flex:7,child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(lstPlantBigAndMedium(lable)[index].name,
                            style:TextStyle(
                                color: const Color(0xFF498552),
                                fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              fontFamily: 'Comfortaa',
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          child: Text(lstPlantBigAndMedium(lable)[index].title, maxLines: 3,overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey,
                              fontFamily: 'Comfortaa',
                            ),),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10,right: 10, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${lstPlantBigAndMedium(lable)[index].price} \$',
                                  style:TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    fontFamily: 'Comfortaa',
                                  ),),
                                ElevatedButton(
                                    child:Icon(
                                        Icons.add,
                                      size: 7.w,
                                    ),
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF498552)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                            )
                                        )
                                    ),
                                    onPressed: (){
                                      Get.to(InfoPlantScreen(plant:lstPlantBigAndMedium(lable)[index],));
                                    }
                                )
                              ],
                            )
                        )

                      ],
                    ),)


                  ],
                ),
              );
            }),
      )
    ],
  );

}