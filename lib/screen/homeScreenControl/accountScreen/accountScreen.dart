import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:getx_firebase/main.dart';

import '../../splashScreen/splashScreen.dart';
import 'editAccInfomationScreen.dart';

class AccountScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    UserController userController = Get.put(UserController());

    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      backgroundColor: Color(0xFFf7f7f7),
      body:Container(
        color: Color(0xFFf7f7f7),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
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
                                       const CircleAvatar(
                                         backgroundImage: AssetImage('assets/images/user.jpg'),
                                         radius: 50,
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
                                                     style: const TextStyle(
                                                         fontFamily: 'Comfortaa',
                                                         color: Colors.white,
                                                         fontWeight: FontWeight.bold,
                                                         fontSize: 20
                                                     ),
                                                     overflow: TextOverflow.ellipsis,
                                                     maxLines: 2,
                                                   ),
                                                 )),
                                             SizedBox(height: 5,),
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
                          SizedBox(height: 15,),
                          Expanded(child:
                          Column(
                            children: [
                              Row(
                                children:[
                                  Icon(FontAwesomeIcons.user,size: 20,color: Colors.white,),
                                  SizedBox(width: 5,),
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
                                  Icon(Icons.local_phone_outlined,size: 20,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text(userController.user.value!.phone,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Comfortaa',
                                    ),),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,size: 20,color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Expanded(child:  Text(userController.user.value!.address
                                    ,overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
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
            ),),
            Expanded(
                flex: 5,
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
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Oder',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Column(
                                    children: const [
                                    Icon(FontAwesomeIcons.receipt,size: 50, color: Color(0xFF498552)),
                                    SizedBox(height: 5,),
                                    Text('Processing',
                                    style:TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 10
                                    ),)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Column(
                                    children: const [
                                      Icon(FontAwesomeIcons.cartFlatbed,size: 50,color: Color(0xFF498552)),
                                      SizedBox(height: 5,),
                                      Text('Delivering',
                                        style:TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 10
                                        ),)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Column(
                                    children: const [
                                      Icon(FontAwesomeIcons.box,size: 50,color: Color(0xFF498552)),
                                      SizedBox(height: 5,),
                                      Text('Complate',
                                        style:TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 10
                                        ),)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Column(
                                    children: const [
                                      Icon(FontAwesomeIcons.rotate,size: 50,color: Color(0xFF498552)),
                                      SizedBox(height: 5,),
                                      Text('Canceled',
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
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 20,right: 20,top: 30),
                      padding: EdgeInsets.only(bottom: 20,top: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFf7f7f7),
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1
                          ),),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Purchase oder',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold
                              ),),
                            const SizedBox(height: 20,),
                            Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/1a.png',width: 100,height: 100,),
                                          SizedBox(height: 5,),
                                          Text('50.56\$',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Color(0xFF498552)
                                            ),),
                                          Text('Cay van tue',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                              fontSize: 10,
                                              color: Colors.grey
                                            ),),

                                        ],
                                      ),),
                                    Padding(padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/2a.png',width: 100,height: 100,),
                                          SizedBox(height: 5,),
                                          Text('50.56\$',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Color(0xFF498552)
                                            ),),
                                          Text('Cay van tue',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Colors.grey
                                            ),),

                                        ],
                                      ),),
                                    Padding(padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/3a.png',width: 100,height: 100,),
                                          SizedBox(height: 5,),
                                          Text('50.56\$',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Color(0xFF498552)
                                            ),),
                                          Text('Cay van tue',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Colors.grey
                                            ),),

                                        ],
                                      ),),
                                    Padding(padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/1.png',width: 100,height: 100,),
                                          SizedBox(height: 5,),
                                          Text('50.56\$',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Color(0xFF498552)
                                            ),),
                                          Text('Cay van tue',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Colors.grey
                                            ),),

                                        ],
                                      ),),
                                    Padding(padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/4.png',width: 100,height: 100,),
                                          SizedBox(height: 5,),
                                          Text('50.56\$',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Color(0xFF498552)
                                            ),),
                                          Text('Cay van tue',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Colors.grey
                                            ),),

                                        ],
                                      ),),
                                    Padding(padding: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/2.png',width: 100,height: 100,),
                                          SizedBox(height: 5,),
                                          Text('50.56\$',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Color(0xFF498552)
                                            ),),
                                          Text('Cay van tue',overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 10,
                                                color: Colors.grey
                                            ),),

                                        ],
                                      ),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),),
          ],
        ),
      ),
    );
  }

}