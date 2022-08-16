
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';


class EditAccInformationScreen extends StatelessWidget{
  const EditAccInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    TextEditingController textEditingControllerEmail = TextEditingController();
    TextEditingController textEditingControllerName= TextEditingController();
    TextEditingController textEditingControllerPhone = TextEditingController();
    TextEditingController textEditingControllerAddress = TextEditingController();
    textEditingControllerEmail.text = userController.user.value!.email;
    textEditingControllerName.text = userController.user.value!.name;
    textEditingControllerPhone.text = userController.user.value!.phone;
    textEditingControllerAddress.text = userController.user.value!.address;
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add your onPressed code here!
          var x = await Get.dialog(
            AlertDialog(
              title: const Text('you want to change?'),
              content: const Text('this will change your data!'),
              actions: [
                TextButton(
                  child: const Text("Close"),
                  onPressed: () => Get.back(result: false),
                ),
                TextButton(
                  child: const Text("Save"),
                  onPressed: () => Get.back(result: true),
                ),
              ],
            ),
          );
          if(
          textEditingControllerPhone.text !='' &&
          textEditingControllerName.text != '' &&
          textEditingControllerAddress.text != ''){
            x?
            userController.updateUser(
                userController.user.value!.email,
                textEditingControllerPhone.text,
                textEditingControllerName.text,
                textEditingControllerAddress.text )
                :
            print('khong thay doi');
          }
          else{
            Get.snackbar('Update failed', 'Please fill out all fields',snackPosition: SnackPosition.BOTTOM);
          }
          userController.getUser(userController.user.value!.email);
        },
        backgroundColor: const Color(0xFF498552),
        child: const Icon(Icons.save,color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text('Edit information',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
              ),
              const SizedBox(height: 50,),
              Expanded(child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Color(0xFF498552)
                      ),),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration:  BoxDecoration(
                        border: Border(
                          bottom: BorderSide( //                    <--- top side
                            color: Colors.grey.shade200,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child:  TextField(
                        onChanged: (text) {
                        },
                        controller: textEditingControllerEmail,
                        cursorColor: Colors.white,
                        decoration: null,
                        enabled: false,
                        style: const TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text('Full name',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Color(0xFF498552)
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration:  BoxDecoration(
                        border: Border(
                          bottom: BorderSide( //                    <--- top side
                            color: Colors.grey.shade200,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child:  TextField(
                        onChanged: (text) {
                        },
                        controller: textEditingControllerName,
                        cursorColor: const Color(0xFF498552),
                        decoration: null,
                        enabled: true,
                        style: const TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text('Phone',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Color(0xFF498552)
                      ),),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration:  BoxDecoration(
                        border: Border(
                          bottom: BorderSide( //                    <--- top side
                            color: Colors.grey.shade200,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child:  TextField(
                        onChanged: (text) {
                        },
                        controller: textEditingControllerPhone,
                        cursorColor: const Color(0xFF498552),
                        decoration: null,
                        keyboardType: TextInputType.phone,
                        enabled: true,
                        style: const TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text('Address',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          color: Color(0xFF498552)
                      ),),
                    const SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration:  BoxDecoration(
                        border: Border(
                          bottom: BorderSide( //                    <--- top side
                            color: Colors.grey.shade200,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child:  TextField(
                        onChanged: (text) {
                        },
                        controller: textEditingControllerAddress,
                        cursorColor: const Color(0xFF498552),
                        decoration: null,
                        enabled: true,
                        style: const TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

}