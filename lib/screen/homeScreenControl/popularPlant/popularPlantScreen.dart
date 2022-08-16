import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/data/plantData.dart';
import 'package:sizer/sizer.dart';

import '../../infoPlantScreen/infoPlantScreen.dart';
import '../../searchScreen/searchScreen.dart';

class PopularPlant extends StatelessWidget{
  const PopularPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditTingControllerPopPlantSearch = TextEditingController();
    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: SafeArea(
        child:Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child:  Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20,bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                        //flex:9,
                        child: InkWell(
                          onTap: ()=>Get.to(SearchScreen()),
                          child: TextField(
                            controller: _textEditTingControllerPopPlantSearch,
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
                          ),
                        )),
                    // Expanded(
                    //     flex: 2,
                    //     child: InkWell(
                    //       onTap: (){
                    //         print('textsearch: ${_textEditTingControllerPopPlantSearch.text}');
                    //       },
                    //       child: Icon(Icons.notifications_none_sharp, color: const Color(0xFF498552),size: 9.w,),
                    //     ))
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Popular Plant \nAmong The People',
                    style:TextStyle(
                      color: const Color(0xFF498552),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      fontFamily: 'Comfortaa',
                    ),),
                ),),
              Expanded(flex: 8,
                  child: GridView.builder(
                      itemCount: lstPlant.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        // chiều cao item
                        mainAxisExtent: 38.h,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                      ),
                      itemBuilder: (context, index){
                        return SizedBox(
                          //color: Colors.purple,
                        //  width: 200,
                          //margin: EdgeInsets.only(left: 20,right: 20),
                          child: Stack(
                            children: [
                              Align(
                                child: Container(
                                  //width: 240,
                                  height: 29.h,
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
                                        padding: const EdgeInsets.only(left: 10, top: 50,bottom: 10,right: 10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                          color: Color(0xFFC8DACB),
                                        ),
                                        child: Text(lstPlant[index].name,
                                          style: const TextStyle(
                                            color: Color(0xFF498552),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Comfortaa',
                                          ),),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10,right: 10),
                                        child: Text(lstPlant[index].title, maxLines: 3,overflow: TextOverflow.ellipsis,
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
                                              Text('${lstPlant[index].price} \$',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Comfortaa',
                                                ),),
                                              ElevatedButton(
                                                  child: const Icon(
                                                      Icons.add
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
                                                    Get.to(InfoPlantScreen(plant: lstPlant[index],));
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
                                child: Image.asset(lstPlant[index].image,height: 125,),
                                alignment: Alignment.topRight,
                              ),

                            ],
                          ),
                        );
                      })),
             // SizedBox(height: 30,),
            ],
          ),
        )

      ),
    );
  }

}