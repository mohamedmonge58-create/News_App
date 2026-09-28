import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providerrr/settings.dart';
import '../view_model/home_view_model.dart';
import 'ArticaleItem.dart';

class SelectedCategoryView extends StatefulWidget {
  const SelectedCategoryView({super.key});

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.wait([
      Provider.of<HomeViewModel>(context, listen: false).getAllSources(),
    ]).then(
      (value) =>
          Provider.of<HomeViewModel>(context, listen: false).getAllArticles(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final settings = context.watch<Settings>();
    final isDark = settings.currentThemeMode == ThemeMode.dark;
    final activeColor = isDark ? Colors.white : Colors.black;
    final inactiveColor = isDark ? Colors.white70 : Colors.black54;

    return Column(
      spacing: 16,
      children: [
        if (vm.selectedCategory == null)
          Center(child: CircularProgressIndicator()),
        if (vm.selectedCategory != null)
          DefaultTabController(
            length: vm.sourcesList.length,
            child: TabBar(
              isScrollable: true,
              onTap: vm.changeTab,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: activeColor,
                  width: 3,
                ),
              ),
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              dividerHeight: 0,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              indicatorColor: Colors.transparent,
              labelColor: activeColor,
              unselectedLabelColor: inactiveColor,
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              tabs: vm.sourcesList
                  .map((source) => Tab(text: source.name))
                  .toList(),
            ),
          ),

        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: vm.articles.length,
            itemBuilder: (context, index) {
              return ArticaleItem(artical: vm.articles[index]);
            },
          ),
        ),
      ],
    );
  }
}
