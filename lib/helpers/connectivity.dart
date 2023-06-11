import 'dart:io'; //InternetAddress utility
import 'dart:async';

 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart'; //For StreamController/Stream


class ConnectionStatusSingleton extends GetxController with StateMixin {



var connectivity =0.obs;
late StreamSubscription<InternetConnectionStatus> _listenter;
@override
  void onInit() {
    connectivity.value=1;
_listenter =InternetConnectionChecker().onStatusChange.listen((InternetConnectionStatus status) {
  switch(status){
    case InternetConnectionStatus.connected:
      connectivity.value=1;
      break;
  case InternetConnectionStatus.disconnected:
      connectivity.value=0;
      break;
  }
});
    super.onInit();
  }
@override
  void onClose() {
   _listenter.cancel();
    super.onClose();
  }
}
