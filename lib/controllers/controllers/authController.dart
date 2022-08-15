import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/userController.dart';
import 'package:getx_firebase/screen/splashScreen/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screen/homeScreenControl/homeScreen_Control.dart';

class AuthController extends GetxController{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value != null? _user.value!.email: null;
  @override
  void onInit() {
    // TODO: implement onInit
    _user.bindStream(_firebaseAuth.authStateChanges());
    super.onInit();
  }
  Future<void> createUserWithEmailAndPassword(String email, String password, String name) async {
    UserController userController = Get.put(UserController());

    try{
      UserCredential _userCredential =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(_userCredential.user != null){
        // lưu thông tin email
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('loginEmail', email);

        Get.snackbar('Create acc done','user: ${_userCredential.user!.email}',snackPosition: SnackPosition.BOTTOM);
        // khỏi tạo dữ liệu user
        await userController.createUser(email,'', name, '');
        Get.offAll(const SplashScreen());
      }else{
        Get.snackbar('Error create acc', '',snackPosition: SnackPosition.BOTTOM);
      }
    }on FirebaseException catch(e){
      print('loi');
      Get.snackbar('Error create acc', e.code,snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> loginWithEmailAndPassword(String email,String password) async {
    try{
     UserCredential _userCredential =await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     print('Login'+ _user.value!.email.toString());
     // lưu thông tin email
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString('loginEmail', email);

     //Get.offAll(const HomeScreenControll());
     Get.offAll(const SplashScreen());
    }on FirebaseException catch(e){
      Get.snackbar('Error login', e.code,snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout(){
    try{
      _firebaseAuth.signOut();
    }catch(e){
      Get.snackbar('Error logout', e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }
}