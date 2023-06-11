

import 'dart:convert';

import 'package:api_session/model/NewsModel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController{

  getData(category) async{
    //Response of the server      //Request
    http.Response response  = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=a9d266ba6a96482ca3919c91b9ed6936'));

    if(response.statusCode == 200){
      print(response.body);

      try{
        //leh news model? 3shan howa 7atetly lis fadya w m7mla data
        return NewsModel.fromJson(jsonDecode(response.body));
      }catch(e){
        Get.snackbar('error: ', e.toString());
      }
    }
  }

  // getData() async{
  //   //Response of the server      //Request
  //   http.Response response  = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=a9d266ba6a96482ca3919c91b9ed6936'));
  //
  //   if(response.statusCode == 200){
  //     print(response.body);
  //
  //     try{
  //       //leh news model? 3shan howa 7atetly lis fadya w m7mla data
  //       return NewsModel.fromJson(jsonDecode(response.body));
  //     }catch(e){
  //       Get.snackbar('error: ', e.toString());
  //     }
  //   }
  // }

  @override
  void onInit() {
    getData('general');
  }
}