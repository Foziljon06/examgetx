
import 'package:examgetx/controllers/home_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=>HomeController(),fenix: true);
  }
}