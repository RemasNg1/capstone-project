import 'package:flutter/material.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({
    super.key,
    required this.titlePage,
    required this.tabTitles,
    required this.setOfTabView,
  });
  final String titlePage;
  final Set<String> tabTitles;
  final Set<Widget> setOfTabView;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(titlePage),
          bottom: TabBar(
            tabs: tabTitles.map((title) => Tab(text: title)).toList(),
          ),
        ),
        body: TabBarView(children: setOfTabView.toList()),
      ),
    );
  }
}
