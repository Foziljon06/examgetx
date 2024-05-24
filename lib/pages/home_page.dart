import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../services/http_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("exam getX"),
        backgroundColor: Colors.orange,
      ),
      body: GetX<HomeController>(
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.articles.isEmpty) {
            return Center(child: Text('No articles found'));
          } else {
            return ListView.builder(
              itemCount: controller.articles.length,
              itemBuilder: (ctx, index) {
                return itemForNews(controller.articles[index], index);
              },
            );
          }
        },
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child: MaterialButton(
          onPressed: () {
           // homeController.callSecondPage(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Icon(Icons.add, color: Colors.white),
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget itemForNews(Article article, int index) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article.urlToImage != null
                  ? Image.network(
                article.urlToImage,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              )
                  : Container(width: 100, height: 100, color: Colors.grey),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  article.description ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
            },
            child: Text(
              article.url,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
