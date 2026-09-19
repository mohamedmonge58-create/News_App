import 'package:flutter/material.dart';
import 'package:news/core/theme/app_assets.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:news/main.dart';
import 'package:news/models/category_model.dart';

import '../widgets/category_card_item.dart';
import '../widgets/custom_drawer_widget.dart';
import '../widgets/selected_category_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> _categories = [
    CategoryModel(id: "general", name: "General", imagePath: AppAssets.general),
    CategoryModel(id: "business", name: "Business", imagePath: AppAssets.business),
    CategoryModel(id: "sports", name: "Sports", imagePath: AppAssets.sports),
    CategoryModel(id: "health", name: "Health", imagePath: AppAssets.health),
    CategoryModel(id: "entertainment", name: "Entertainment", imagePath: AppAssets.entertainment),
    CategoryModel(id: "technology", name: "Technology", imagePath: AppAssets.technology),
    CategoryModel(id: "science", name: "Science", imagePath: AppAssets.science),
  ];

  CategoryModel? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_selectedCategory == null ? "News App" : _selectedCategory!.name),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SvgPicture.asset(
              AppAssets.searchLogo,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawerWidget(
        onHomeTap: () {
          setState(() {
            _selectedCategory = null;
            navigatorKey.currentState!.pop();
          });
        },
      ),
      body: _selectedCategory == null
          ? Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning \nHere is Some News For You",
              style: theme.textTheme.headlineSmall!.copyWith(
                height: 1.2,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = _categories[index];
                      });
                    },
                    child: CategoryCardItem(
                      index: index,
                      categoryModel: _categories[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemCount: _categories.length,
              ),
            ),
          ],
        ),
      )
          : SelectedCategoryView(selectedCategory: _selectedCategory!),
    );
  }
}