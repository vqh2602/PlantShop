import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
RxInt selectTitleControl = RxInt(0);

  selectChange(int index)=> selectTitleControl.value = index;
}