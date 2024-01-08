import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/constants/style/style.dart';
import 'package:flutter_task/views/layouts/layout_calendar.dart';
import 'package:flutter_task/views/layouts/layout_home.dart';
import 'package:flutter_task/views/layouts/layout_notification.dart';
import 'package:flutter_task/views/layouts/layout_profile.dart';

import '../../packages/bottom_navigation_bar/src/bottom_bar.dart';

class ScreenHomePage extends StatefulWidget {
  // final String title;

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  // final List<Color> colors = [Colors.yellow, Colors.red, Colors.green, Colors.blue, Colors.pink];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          iconDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          barDecoration: BoxDecoration(

          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: appBoxShadow
            ),
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
              controller: tabController,
              onTap: (index){
                tabController.index=index;
                setState(() {

                });
              },
              dividerColor: Colors.transparent,
              indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      color:appPrimaryColor, width: 5),
                  insets: EdgeInsets.fromLTRB(25, 0, 25, 9)),
              tabs: [
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                      child: Icon(
                        Icons.home,
                        color: tabController.index == 0 ? appPrimaryColor : Color(0xFF0D0D0D),
                      )),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                      child: Icon(
                        Icons.calendar_month,
                        color: tabController.index == 1 ? appPrimaryColor : Color(0xFF0D0D0D),
                      )),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                      child: Icon(
                        Icons.notifications_none,
                        color: tabController.index == 2 ? appPrimaryColor : Color(0xFF0D0D0D),
                      )),
                ),
                SizedBox(
                  height: 55,
                  width: 40,
                  child: Center(
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: tabController.index == 3 ? appPrimaryColor : Color(0xFF0D0D0D),
                      )),
                ),
              ],
            ),
          ),
          fit: StackFit.expand,
          borderRadius: BorderRadius.circular(50),
          duration: Duration(seconds: 1),
          curve: Curves.decelerate,
          showIcon: false,
          // width: MediaQuery.of(context).size.width * 0.8,
          barColor: Colors.transparent,
          start: 0,
          end: 0,
          offset: 0,
          // barAlignment: Alignment.bottomCenter,
          // iconHeight: 35,
          // iconWidth: 35,
          // reverse: false,
          // hideOnScroll: true,
          // scrollOpposite: false,
          // onBottomBarHidden: () {},
          // onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,

            dragStartBehavior: DragStartBehavior.down,
            physics: NeverScrollableScrollPhysics(),
            children: [
              LayoutHome(),
              LayoutCalendar(),
              LayoutNotification(),
              LayoutProfile(),
            ],
          ),
        ),
      ),
    );
  }
}