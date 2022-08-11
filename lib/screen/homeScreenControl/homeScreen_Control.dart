import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:getx_firebase/screen/homeScreenControl/popularPlant/popularPlantScreen.dart';
import 'package:getx_firebase/screen/homeScreenControl/qrScanPlant/qrScanPlant.dart';

import '../../main.dart';
import 'accountScreen/accountScreen.dart';
import 'homeScreen/homeScreen.dart';
import 'myCart/myCartScreen.dart';



class HomeScreenControll extends StatefulWidget{
  const HomeScreenControll({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myHomeScreenControll();
  }

}
class _myHomeScreenControll extends State<HomeScreenControll>{
  var _bottomNavIndex = 0; //default index of a
  //late PageController _pageController;
  final iconList = <IconData>[
    Icons.home_filled,
    FontAwesomeIcons.seedling,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];
  UserController userController = Get.put(UserController());
  AuthController authController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getUser(authController.user!);
    // pageController = PageController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    //_pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      //destination screen
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(QRViewExample());
      },
        child: const Icon(Icons.qr_code_scanner,size: 30,color: Colors.white,),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        activeColor: const Color(0xFF498552),
        inactiveColor: const Color(0xFFC8DACB),
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        height: 70,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            pageController.jumpToPage(index);
          });
    }

    //other params
    ),
    body: Container
    (
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => _bottomNavIndex = index);
          },
          children: <Widget>[
            const HomeScreen(),
            const PopularPlant(),
            MyCartScreen(),
            AccountScreen()
          ],
        ),
      ),
    );
  }


}