import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("exam getX"),
        backgroundColor: Colors.orange,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: homeController.userlist.length,
            itemBuilder: (ctx, index) => itemForNews(homeController.userlist[index], index),
          );
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

  Widget viewOfNewsList(bool isLoading, List<Article> articles) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: articles.length,
          itemBuilder: (ctx, index) => itemForNews(articles[index], index),
        ),
        if (isLoading)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  Widget itemForNews(Article article, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            article.title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          // Author
          Text(
            article.author ?? 'Unknown Author',
            style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16.0),
          // Image and Content Row
          if (article.urlToImage != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  article.urlToImage!,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16.0),
                // Content
                Expanded(
                  child: Text(article.content ?? 'No content available'),
                ),
              ],
            ),
          const SizedBox(height: 16.0),
          // URL
          Text(
            article.url ?? '',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }


}
