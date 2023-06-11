

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../model/Articles.dart';

class HomeController extends GetxController{
  final currentIndex = 0.obs;

  onTap(value){
    currentIndex.value = value;
  }


}