import 'package:flutter/material.dart';
import 'package:news/core/theme/app_assets.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:provider/provider.dart';

import '../../search/view/search_view.dart';
import '../../search/view_model/search_view_model.dart';
import '../view_model/home_view_model.dart';
import '../widgets/category_card_item.dart';
import '../widgets/custom_drawer_widget.dart';
import '../widgets/selected_category_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            vm.selectedCategory == null
                ? "News App"
                : vm.selectedCategory!.name,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: GestureDetector(
              onTap: () {
                context.read<SearchViewModel>().setDefaultArticles(vm.articles);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchView()),
                );
              },
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
          ),
        ],
      ),
      drawer: CustomDrawerWidget(
        onHomeTap: () {
          vm.changeCategory(vm.selectedCategory!);
        },
      ),
      body: vm.selectedCategory == null
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
                            vm.changeCategory(vm.categories[index]);
                          },
                          child: CategoryCardItem(
                            index: index,
                            categoryModel: vm.categories[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: vm.categories.length,
                    ),
                  ),
                ],
              ),
            )
          : SelectedCategoryView(),
    );
  }
}
