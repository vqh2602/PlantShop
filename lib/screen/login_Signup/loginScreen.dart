import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/screen/login_Signup/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends GetWidget<AuthController>{
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingControllerEmail = TextEditingController();
    TextEditingController _textEditingControllerPass = TextEditingController();


    Future<void> getEmailLogin() async {
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      _textEditingControllerEmail.text = prefs.getString('loginEmail')??'' ;
    }
    getEmailLogin();
    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                color: Color(0xFF64976C),
                width: double.infinity,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      width:  200,
                      height:  200,
                    ),
                    SizedBox(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                              'Plant Shop',
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Comfortaa',
                              ),
                              colors: [
                                Colors.white,
                                const Color(0xFFE9F0EA),
                                Colors.white24,
                              ],
                              speed: const Duration(seconds: 1)
                          ),
                        ],
                        // isRepeatingAnimation: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    )
                  ],
                ),
              )),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(padding: EdgeInsets.all(20),
                        child: Text('Login',style:
                        TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),),),


                  Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: _textEditingControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),),
                  Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                    child: TextField(
                      controller: _textEditingControllerPass,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                      ),
                    ),),
                  ),
                  Padding(padding: EdgeInsets.all(20),
                    child:  ElevatedButton(
                        onPressed: (){
                          controller.loginWithEmailAndPassword(
                              _textEditingControllerEmail.text,
                              _textEditingControllerPass.text);
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
                          child: Center(child: Text('Login',style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Comfortaa',
                          ),)),
                        )),
                  ),
                  Padding(padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have a account? ',style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Comfortaa',
                      ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(const SignupScreen());
                        },
                        child: const Text('Signup',style: TextStyle(
                            color: Color(0xFF215528),
                          fontFamily: 'Comfortaa',
                        ),),
                      )
                    ],
                  ),)
                  // ElevatedButton(
                  //     onPressed: (){
                  //       Get.to(SignupScreen());
                  //     },
                  //     child: const Text('Signup')),
                  // ElevatedButton(
                  //     onPressed: (){
                  //       controller.logout();
                  //     },
                  //     child: const Text('Logout'))
                ],
              ),),

            ],
          ),
        ),

      ),
    );
  }


}