import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/model.dart';
import '../services/http_service.dart';


class HomeController extends GetxController {
  List<Article> userlist = [];
  bool isLoading = false;

  loadArticles() async {
      isLoading = true;
      update();
    var response = await Network.GET(Network.API_GET_INFOS, Network.paramsArticle());
    if (response != null) {
      var users = Network.parseArticles(response);
        userlist.addAll(users);
        print(userlist.length);
        isLoading = false;
        update();
    } else {
        isLoading = false;
        update();
    }
  }

}












//   loadArticles() async {
//     var response =
//     await Network.GET(Network.API_GET_INFOS, Network.paramsArticle());
//     List<Article> articlesList = Network.parseArticles(response!);
//     print(articlesList.length);
//     articles = articlesList;
//     update();
//   }
// }

// if (controller.articles.isEmpty) {
// return Center(child: CircularProgressIndicator());
// } else {
// return ListView.builder(
// itemCount: controller.articles.length,
// itemBuilder: (ctx, index) {
// return itemForNews(controller.articles[index],index);
// },
// );
// }