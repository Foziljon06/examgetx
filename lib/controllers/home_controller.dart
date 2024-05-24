import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../services/http_service.dart';

class HomeController extends GetxController {
  var isLoading = true;
  var articles = <Article>[];

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      var fetchedArticles = await NewsService().fetchTopHeadlines();
      articles.assignAll(fetchedArticles);
    } finally {
      isLoading;
    }
  }

}
