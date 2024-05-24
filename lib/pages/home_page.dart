import 'package:examgetx/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/http_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Article>> items;
  final homeController = Get.find<HomeController>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = NewsService().fetchTopHeadlines()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("exam getX",),
        backgroundColor: Colors.orange,
      ),
      body: GetBuilder<HomeController>(

        builder: (context,){
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: articles[index].urlToImage != null
                      ? Image.network(
                    articles[index].urlToImage,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                      : null,
                  title: Text(articles[index].title),
                  subtitle: Text(articles[index].description),
                  onTap: () => _openArticle(context, articles[index].url),
                ),
              );
            },
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



// Center(
// child: Text("Something",style: TextStyle(color: Colors.orange),),
// );