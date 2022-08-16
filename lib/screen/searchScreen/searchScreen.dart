import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/data/plantData.dart';
import 'package:sizer/sizer.dart';

import '../../models/plant.dart';
import '../infoPlantScreen/infoPlantScreen.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  //  throw UnimplementedError();
    return _MySearchScreen();
  }

}

class _MySearchScreen extends State<SearchScreen>{
  List<Plant> listPlantResult = [];
  @override
  Widget build(BuildContext context) {
    //TextEditingController _textEditTingControllerPopPlantSearch = TextEditingController();

    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20,bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      //flex:9,
                        child: TextField(
                          //controller: _textEditTingControllerPopPlantSearch,
                          onChanged: searchPlant,
                          autofocus: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,size: 7.w,),
                              //hintText: 'Search',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.white, width: 1)),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.white, width: 1)),
                              fillColor: Colors.white,
                              filled: true,
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
              Expanded(child: ListView.builder(
                  itemCount: listPlantResult.length,
                  itemBuilder: (context, index){
                    return Container(
                      //color: Colors.purple,
                      height: 20.h,
                      margin: const EdgeInsets.only(top: 0),
                      padding: const EdgeInsets.only(top: 20,bottom: 10),
                      decoration: const BoxDecoration(
                        //borderRadius: BorderRadius.circular(20),
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFF498552),
                                  width: 1
                              )
                          )
                        //color: const Color(0xFFE9F0EA),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex:3,
                            child: Image.asset(listPlantResult[index].image,height: 20.h,),),
                          Expanded(flex:7,child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(listPlantResult[index].name,
                                  style:TextStyle(
                                    color: const Color(0xFF498552),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                    fontFamily: 'Comfortaa',
                                  ),),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10,right: 10),
                                child: Text(listPlantResult[index].title, maxLines: 3,overflow: TextOverflow.ellipsis,
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
                                      Text('${listPlantResult[index].price} \$',
                                        style:TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
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
                                            Get.to(InfoPlantScreen(plant: listPlantResult[index],));
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
                  }))
            ],
          ),
        ),
      ),
    );
  }

  void searchPlant(String query){
    var listResult = lstPlant.where((element){
      var plantName = element.name.toLowerCase();
      var toLowQuery = query.toLowerCase();
      return plantName.contains(toLowQuery);
    }).toList();
    setState(() {
      listPlantResult = listResult;
    });
  }
}