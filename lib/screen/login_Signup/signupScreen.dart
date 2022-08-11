import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/bindings/authBinding.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';

import 'loginScreen.dart';

class SignupScreen extends GetWidget<AuthController>{
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingControllerEmail = TextEditingController();
    TextEditingController _textEditingControllerPass = TextEditingController();
    TextEditingController _textEditingControllerPassConfirm = TextEditingController();
    TextEditingController _textEditingControllerName = TextEditingController();
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(padding: EdgeInsets.all(20),
                    child: Text('Signup',style:
                    TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold
                    ),),),

                  Column(
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: _textEditingControllerName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            prefixIcon: const Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),),
                      SizedBox(height: 20,),
                      Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: _textEditingControllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),),
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: _textEditingControllerPass,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),),
                      ),
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          controller: _textEditingControllerPassConfirm,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.all(20),
                    child:  ElevatedButton(
                        onPressed: (){
                          if(_textEditingControllerPassConfirm.text != _textEditingControllerPass.text){
                            Get.snackbar('Mismatch password', '',snackPosition: SnackPosition.BOTTOM);
                          }else{
                            controller.createUserWithEmailAndPassword(
                                _textEditingControllerEmail.text,
                                _textEditingControllerPass.text,
                                _textEditingControllerName.text);
                          }
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
                          child: Center(child: Text('Signup',style: TextStyle(
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
                          'You have a account? ',style: TextStyle(
                            color: Colors.grey
                        ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(const LoginScreen());
                          },
                          child: const Text('Login',style: TextStyle(
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