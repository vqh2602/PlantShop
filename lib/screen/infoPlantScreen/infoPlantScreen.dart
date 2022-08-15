import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_firebase/controllers/controllers/myCartController.dart';
import 'package:getx_firebase/models/plant.dart';
import 'package:getx_firebase/models/sqlLiteMyCart/myCart.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class InfoPlantScreen extends StatelessWidget{
  Plant plant;
  InfoPlantScreen({Key? key, required this.plant}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    MyCartController myCartController = Get.put(MyCartController());
//define
    GlobalKey previewContainer = GlobalKey();

    TextStyle title(){
      return const TextStyle(
        color: Colors.grey,
        fontSize: 13,
        fontFamily: 'Comfortaa',
      );
    }
    TextStyle destitle(){
      return const TextStyle(
        color: Color(0xFF498552),
        fontWeight: FontWeight.bold,
        fontFamily: 'Comfortaa',
        fontSize: 15
      );
    }
    // TODO: implement build
    return Scaffold(
      backgroundColor:const Color(0xFFE9F0EA),
      body:
      RepaintBoundary(
          key: previewContainer,
          child: Container(
            color: Color(0xFFE9F0EA),
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: (){
                        //call this function for sharing screenshot
                        ShareFilesAndScreenshotWidgets().shareScreenshot(
                            previewContainer,500,
                            'Plant Shop: '+plant.name ,
                            "Plantshop.png",
                            "image/png",
                            text: "Buy now!");
                      },
                      child: Icon(Icons.share,color: Color(0xFF498552),size: 35,),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      //margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Image.asset(plant.image),
                              )),
                          Expanded(
                              flex:2,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Size',style: title(),),
                                    const SizedBox(height: 5,),
                                    Text(plant.info.size,style: destitle(),),
                                    const SizedBox(height: 20,),
                                    Text('Humidity',style: title(),),
                                    const SizedBox(height: 5,),
                                    Text('${plant.info.hum}%',style: destitle(),),
                                    const SizedBox(height: 20,),
                                    Text('Light',style: title(),),
                                    const SizedBox(height: 5,),
                                    Text(plant.info.light,style: destitle(),),
                                    const SizedBox(height: 20,),
                                    Text('Temperature',style: title(),),
                                    const SizedBox(height: 5,),
                                    Text(plant.info.temp,style: destitle(),)
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                          color: Colors.white
                      ),
                      child:Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.only(top: 20),
                        child:  Column(
                          children: [
                            Expanded(
                                flex:7,child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10,),
                                  Text(
                                    plant.name,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '${plant.price} \$',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF498552),
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    plant.des,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text(
                                    'Photos',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF498552),
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Padding(padding: EdgeInsets.only(right: 20),child: Image.asset('assets/images/1a.png',width: 100,height: 100,),),
                                          Padding(padding: EdgeInsets.only(right: 20),child: Image.asset('assets/images/4a.png',width: 100,height: 100,),),
                                          Padding(padding: EdgeInsets.only(right: 20),child: Image.asset('assets/images/3a.png',width: 100,height: 100,),),
                                          Padding(padding: EdgeInsets.only(right: 20),child: Image.asset('assets/images/4a.png',width: 100,height: 100,),),
                                          Padding(padding: EdgeInsets.only(right: 20),child: Image.asset('assets/images/2a.png',width: 100,height: 100,),),
                                          Padding(padding: EdgeInsets.only(right: 20),child: Image.asset('assets/images/1a.png',width: 100,height: 100,),),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                            Expanded(
                              flex: 2,
                              child:  Padding(padding: EdgeInsets.only(top: 20,bottom: 20,right: 20),
                                child:  ElevatedButton(
                                    onPressed: (){
                                      myCartController.createLstMyCart(plant.id,1);
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
                                      child: Center(child: Text('Add to cart',style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Comfortaa',
                                      ),)),
                                    )),
                              ),)
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
      ),
    );
  }

}