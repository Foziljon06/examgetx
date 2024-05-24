import 'package:examgetx/pages/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{

  callSecondPage(BuildContext context){
    Get.to(SecondPage());
  //   Navigator.push(context, MaterialPageRoute(
  //       builder: (BuildContext context) {
  //       return SecondPage();
  //   }));

   }
}