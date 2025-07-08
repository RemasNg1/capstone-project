import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';

class ProviderCustomTabView extends StatelessWidget {
  const ProviderCustomTabView({
    super.key,
    required this.titlePage,
    required this.tabTitles,
    required this.setOfTabView,
  });
  final String titlePage;
  final List<String> tabTitles;
  final List<Widget> setOfTabView;

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
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.blue,
            tabs: tabTitles.map((title) => Tab(text: title)).toList(),
          ),
        ),
        body: TabBarView(children: setOfTabView),
      ),
    );
  }
}
