import 'package:examgetx/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("exam getX",),
        backgroundColor: Colors.orange,
      ),
      body: GetBuilder<HomeController>(
        builder: (context){
          return Center(
            child: Text("Something",style: TextStyle(color: Colors.orange),),
          );
        },
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent, // Background color of the button
        child: MaterialButton(
          onPressed: () {
            homeController.callSecondPage(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Icon(Icons.add,color: Colors.white,),
          color: Colors.orange,
        ),
      ),
    );
  }
}
