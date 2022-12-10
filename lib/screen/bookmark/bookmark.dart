import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsapi/model/model_news.dart';

import '../../controller/news_controller.dart';
import '../../utils/constant.dart';

class Bookmarkscreen extends StatefulWidget {
  const Bookmarkscreen({super.key});

  @override
  State<Bookmarkscreen> createState() => _BookmarkscreenState();
}

class _BookmarkscreenState extends State<Bookmarkscreen> {
  final NewsController _newsController = Get.find<NewsController>();

  @override
  void initState() {
    _newsController.getBookmarked();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (_newsController.bookmarkedlist.isNotEmpty)
          ? ListView.separated(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 15),
              itemCount: _newsController.bookmarkedlist.length,
              itemBuilder: (context, index) {
                return buildnewscard(
                    _newsController.bookmarkedlist, index, context);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
          : const Center(child: Text("No Data")),
    );
  }

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

                userList.removeWhere(
                    (element) => element.title == _modelnews[index].title);
                _newsController.bookmarkedlist.removeWhere(
                    (element) => element.title == _modelnews[index].title);
                _newsController.getBookmarked();

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
}
