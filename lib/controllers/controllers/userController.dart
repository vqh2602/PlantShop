

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';

import '../../models/user.dart';

class UserController extends GetxController{
  AuthController authController = Get.find();
  Rx<UserCustom?> user = Rx<UserCustom?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser(authController.user!);
  }

  Future<void> createUser(String email, String phone, String name, String address) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    final docRef =db.collection("users").doc("idLastUser");
    await docRef.get().then(
          (DocumentSnapshot doc) async {
        final data = doc.data() as Map<String, dynamic>;
        // ...

        // cạp nhat ad
        print('id: ${data["idLastUser"]}');
        final user = <String, dynamic>{
          "email": email,
          "phone": phone,
          "name": name,
          "address": address,
          "idUser": data["idLastUser"] +1,
        };
        await db
            .collection("users")
            .doc(email)
            .set(user).whenComplete((){
              // cập nhật lại lát id
          final Ref = db.collection("users").doc("idLastUser");
          Ref.update({"idLastUser":data["idLastUser"]+1,}).then(
                  (value){
              },
              onError: (e){});
        });



      },
      onError: (e) => print("Error getting document: $e"),
    );


    // Add a new document with a generated ID
    // db.collection("users").add(user).then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));

    Future.delayed(const Duration(seconds: 1), () {
      getUser(email);
      // Prints after 1 second.
    });


  }
  void getUser(String email){
    FirebaseFirestore db = FirebaseFirestore.instance;
    AuthController authController = Get.find();
    String emailUser =  authController.user!;
    db.collection("users").where("email", isEqualTo: emailUser).get().then(
          (res) async {
        final docRef =db.collection("users").doc(emailUser);
        await docRef.get().then(
              (DocumentSnapshot doc) async {
            final data = doc.data() as Map<String, dynamic>;
            // ...
            UserCustom userCustom = UserCustom(id: data["idUser"],email: data["email"], name: data["name"], phone: data["phone"], address: data["address"]);
            print("in customusser: ${userCustom.name}");
            //await Future.delayed(const Duration(seconds: 1));

            user.value = userCustom;
              },
          onError: (e) => print("Error getting document: $e"),
        );


          },
          onError: (e) => print("Error getting document: $e"),
    );
  }

  Future<void> updateUser(String email, String phone, String name, String address) async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("users").where("email", isEqualTo: email).get().then(
          (res) async {

        final docRef =db.collection("users").doc(email);
        await docRef.get().then(
              (DocumentSnapshot doc) async {
            final data = doc.data() as Map<String, dynamic>;
            // ...
            // print(difference.inDays);
              // cạp nhat ad
              final Ref = db.collection("users").doc(email);
              Ref.update({"phone":phone, "name":name, "address" : address}).then(
                      (value){
                        Get.snackbar('Update successful', '',snackPosition: SnackPosition.BOTTOM);
                        getUser(email);
                      },
                  onError: (e) => Get.snackbar('Update failed', '',snackPosition: SnackPosition.BOTTOM));
            }
        );
      },
      onError: (e) => print("Error completing: $e"),
    );

  }

  // Future<int?> getLastIDUser() async{
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //
  //       final docRef =db.collection("users").doc("idLastUser");
  //       await docRef.get().then(
  //             (DocumentSnapshot doc) async {
  //           final data = doc.data() as Map<String, dynamic>;
  //           // ...
  //
  //           // cạp nhat ad
  //           print('id: ${data["idLastUser"]}');
  //           return data["idLastUser"];
  //
  //
  //         },
  //         onError: (e) => print("Error getting document: $e"),
  //       );
  // }

}