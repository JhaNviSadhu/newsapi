import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsapi/controller/news_controller.dart';
import 'package:newsapi/model/model_news.dart';
import 'package:newsapi/theme/themes.dart';
import 'package:newsapi/utils/constant.dart';
import '../../utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NewsController _newsController = Get.find<NewsController>();
  PageController controller = PageController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _newsController.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchbar(),
        const SizedBox(height: 15),
        Expanded(
          child: Obx(
            (() {
              List<Article> _modelnews = (searchController.text.isEmpty)
                  ? _newsController.newslist
                  : _newsController.filterlist;
              return (_modelnews.isNotEmpty)
                  ? ListView.separated(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      itemCount: _modelnews.length,
                      itemBuilder: (context, index) {
                        return buildnewscard(_modelnews, index, context);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    )
                  : Center(
                      child: (_newsController.isLoading.value)
                          ? const CircularProgressIndicator()
                          : const Text("No Data"));
            }),
          ),
        ),
      ],
    );
  }

  //news card with image and title
  ClipRRect buildnewscard(
      List<Article> _modelnews, int index, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: CachedNetworkImage(
              imageUrl: "${_modelnews[index].urlToImage}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${_modelnews[index].urlToImage}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${_modelnews[index].title}",
                  style: Poppins.kTextStyle16Blue700,
                  maxLines: 3,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                // store data
                _modelnews[index].isBookmarked =
                    (!_modelnews[index].isBookmarked);
                setState(() {});

                List<Article> userList = [];

                if (getStringAsync(kbookmark).isNotEmpty) {
                  String strJsonUserList = getStringAsync(kbookmark);
                  print(strJsonUserList);
                  userList = userModelFromJson(strJsonUserList);

                  print(userList);
                }

                if (_modelnews[index].isBookmarked) {
                  // append User in List
                  userList.add(Article(
                      title: _modelnews[index].title,
                      urlToImage: _modelnews[index].urlToImage));
                } else {
                  userList.removeWhere(
                      (element) => element.title == _modelnews[index].title);
                }

                print('=====================');
                //   // // encode data
                var json = userModelToJson(userList);
                //   // var encodedData = jsonEncode(userList.toList());
                //   // store List in pref
                setValue(kbookmark, json);
                print('=====================');

                var userdata2 = jsonDecode(getStringAsync(kbookmark));
                print(userdata2);
                print(' Final list of=====================');
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    _modelnews[index].isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border_outlined,
                    color: const Color.fromRGBO(247, 174, 0, 1),
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //search
  filterSearchResults(String query) {
    if (query.isNotEmpty) {
      _newsController.filterlist.value = _newsController.filterlist
          .where((p0) => p0.title?.toLowerCase().contains(query) ?? false)
          .toList();
      setState(() {});

      _newsController.filterlist.refresh();
    } else {
      _newsController.filterlist.value = _newsController.newslist.value;
    }
  }

  // searchbar
  Padding buildSearchbar() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
      child: TextFormField(
        controller: searchController,
        onChanged: (value) {
          filterSearchResults(value);
        },
        cursorColor: primarycolor,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: primarycolor,
          ),
          filled: true,
          fillColor: Themes.containerColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Search",
          hintStyle: LaoSangamMN.kTextStyleHintText,
          contentPadding: const EdgeInsets.only(left: 10),
        ),
      ),
    );
  }
}
