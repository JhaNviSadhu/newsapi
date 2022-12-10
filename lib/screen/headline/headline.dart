import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsapi/controller/news_controller.dart';
import 'package:newsapi/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsHeadline extends StatefulWidget {
  const NewsHeadline({super.key});

  @override
  State<NewsHeadline> createState() => _NewsHeadlineState();
}

class _NewsHeadlineState extends State<NewsHeadline> {
  final NewsController _newsController = Get.find<NewsController>();

  @override
  void initState() {
    _newsController.getHeadlines();
    super.initState();
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _newsController.headlineNewslist.isNotEmpty
          ? ListView.separated(
              itemCount: _newsController.headlineNewslist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "${_newsController.headlineNewslist[index].title}",
                        style: LaoSangamMN.kTextStyle18Bold,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (_newsController.headlineNewslist[index].content !=
                                null)
                            ? "${_newsController.headlineNewslist[index].content}"
                            : '',
                        style: LaoSangamMN.kTextStyle16regular,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            _launchInBrowser(Uri.parse(
                                _newsController.headlineNewslist[index].url ??
                                    ''));
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              // backgroundColor: redColor,
                              minimumSize: Size(40, 20),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          child: Text(
                            "ReadMore",
                            style: LaoSangamMN.kTextStyle14Normal,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                  color: Colors.blueGrey[300],
                );
              },
            )
          : Container(),
    );
  }
}
