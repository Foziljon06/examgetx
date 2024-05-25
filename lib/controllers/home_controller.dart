import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../services/http_service.dart';

class HomeController extends GetxController {
  List<Article> articles = [];

  loadArticles() async {
    var response =
    await Network.GET(Network.API_GET_INFOS, Network.paramsArticle());
    List<Article> articlesList = Network.parseArticles(response!);
    print(articlesList.length);

    articles = articlesList;
    update();
  }
}
