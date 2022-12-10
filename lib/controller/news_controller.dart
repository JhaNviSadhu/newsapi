import 'dart:convert';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsapi/model/model_news.dart';
import 'package:newsapi/utils/constant.dart';

import '../main.dart';
import '../network/api_provider.dart';
import '../network/rest_apis.dart';

class NewsController extends GetxController {
  var newslist = <Article>[].obs;
  var headlineNewslist = <Article>[].obs;
  var bookmarkedlist = <Article>[].obs;
  var filterlist = <Article>[].obs;
  var isLoading = false.obs;

  getAllNews() {
    final parameter = {
      'q': "cricket",
      'apiKey': APIPath.apikey,
    };
    isLoading.value = true;
    sl
        .get<APIProvider>()
        .getAPICallWithParameter(APIPath.everything, parameter)
        .then((response) {
      ModelNewsList _modelnews = modelNewsListFromJson(response.data);
      if (_modelnews.status == "ok") {
        dynamic userdata2 = getStringAsync(kbookmark);
        if (userdata2 != '') {
          userdata2 = jsonDecode(userdata2);
        }
        if (userdata2.isNotEmpty) {
          _modelnews.articles?.forEach((element) {
            userdata2.forEach((inelement) {
              if (inelement["title"] == element.title) {
                element.isBookmarked = true;
              }
            });
          });
        }
        isLoading.value = false;

        newslist.value = _modelnews.articles ?? [];
        filterlist.value = _modelnews.articles ?? [];
      } else {
        isLoading.value = false;
      }
    }).catchError((err) {
      // hideLoading();
      isLoading.value = false;
    });
  }

  getHeadlines() {
    final parameter = {
      'country': 'us',
      'apiKey': APIPath.apikey,
    };

    sl
        .get<APIProvider>()
        .getAPICallWithParameter(APIPath.topHeadlines, parameter)
        .then((response) {
      ModelNewsList _modelnews = modelNewsListFromJson(response.data);
      if (_modelnews.status == "ok") {
        headlineNewslist.value = _modelnews.articles ?? [];
        headlineNewslist.forEach((element) {
          var newContant = element.content?.split("[");

          element.content = newContant?[0];
        });
      }
    }).catchError((err) {
      // hideLoading();
    });
  }

  getBookmarked() {
    List userdata2 = jsonDecode(getStringAsync(kbookmark));

    bookmarkedlist.value = userdata2
        .map((e) => Article(
            title: e["title"], urlToImage: e["urlToImage"], isBookmarked: true))
        .toList();
  }
}
