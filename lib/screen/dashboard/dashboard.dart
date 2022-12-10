import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/screen/bookmark/bookmark.dart';
import 'package:newsapi/screen/headline/headline.dart';
import 'package:newsapi/screen/home/home.dart';
import 'package:newsapi/theme/themes.dart';
import 'package:newsapi/theme/themeservice.dart';
import 'package:newsapi/utils/constant.dart';
import 'package:newsapi/utils/images.dart';

import '../../utils/colors.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({
    Key? key,
  }) : super(key: key);

  @override
  _DashbordState createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  List<Widget> widgets = [];

  final themeController = Get.put(ThemeController());

  @override
  void initState() {
    // currentIndex = widget.currentIndex;
    init();
    super.initState();
  }

  init() async {
    widgets.add(const MyHomePage());
    widgets.add(const NewsHeadline());
    widgets.add(const Bookmarkscreen());
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Container(child: widgets[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(Images.homeIC),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Images.news),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Images.bookmark),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          _onItemTapped(value);
        },
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Themes.appBarColor,
      title: Text(
        "News",
        style: Poppins.kTextStyle20Black700Medium
            .copyWith(color: Themes.textReverseColor),
      ),
      actions: [
        Switch(
          value: Get.isDarkMode,
          activeColor: primarycolor,
          onChanged: (value) {
            Get.changeTheme(ThemeData.light());

            if (Get.isDarkMode) {
              themeController.changeThemeMode((ThemeMode.light));
              themeController.saveTheme(false);
            } else {
              themeController.changeThemeMode((ThemeMode.dark));
              themeController.saveTheme(true);
            }
            Future.delayed(const Duration(milliseconds: 150), () {
              // Phoenix.rebirth(context);
              setState(() {});
            });
          },
        ),
      ],
    );
  }
}
