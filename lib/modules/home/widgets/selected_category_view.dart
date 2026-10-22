
import 'package:flutter/material.dart';
import 'package:news/models/artical.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/source_model.dart';

import '../../../core/network/network_request_services.dart';
import 'ArticaleItem.dart';
import 'article_details_view.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryModel selectedCategory;

  const SelectedCategoryView({
    super.key,
    required this.selectedCategory,
  });

  @override
  State<SelectedCategoryView> createState() =>
      _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  late Future<List<Source>> _sourcesFuture;
  Future<List<Artical>>? _articlesFuture;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _sourcesFuture =
        NetworkRequestServices.getAllSources(widget.selectedCategory.id);
  }

  @override
  void didUpdateWidget(covariant SelectedCategoryView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedCategory.id != widget.selectedCategory.id) {
      _selectedIndex = 0;
      _articlesFuture = null;
      _sourcesFuture =
          NetworkRequestServices.getAllSources(widget.selectedCategory.id);
    }
  }

  void _selectSource(List<Source> sources, int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
      _articlesFuture =
          NetworkRequestServices.getAllArticles(sources[index].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>>(
      future: _sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final sources = snapshot.data ?? [];

        if (sources.isEmpty) {
          return const Center(child: Text('لا توجد مصادر متاحة'));
        }

        if (_selectedIndex >= sources.length) {
          _selectedIndex = 0;
        }

        final selectedSource = sources[_selectedIndex];

        // Load the first source initially, and when the category changes.
        _articlesFuture ??=
            NetworkRequestServices.getAllArticles(selectedSource.id);

        return SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              DefaultTabController(
                key: ValueKey(widget.selectedCategory.id),
                length: sources.length,
                child: TabBar(
                  isScrollable: true,
                  onTap: (index) => _selectSource(sources, index),
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              ),

              FutureBuilder<List<Artical>>(
                future: _articlesFuture,
                key: ValueKey(selectedSource.id),
                builder: (context, articlesSnapshot) {
                  if (articlesSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (articlesSnapshot.hasError) {
                    return Center(
                      child: Text(articlesSnapshot.error.toString()),
                    );
                  }

                  final articles = articlesSnapshot.data ?? [];

                  if (articles.isEmpty) {
                    return const Center(
                      child: Text('لا توجد مقالات لهذا المصدر'),
                    );
                  }

                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];

                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                initialChildSize: 0.75,
                                minChildSize: 0.45,
                                maxChildSize: 0.80,
                                expand: false,
                                builder: (context, scrollController) {
                                  return ClipRRect(
                                    borderRadius:
                                    const BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                    child: ArticleDetailsView(
                                      artical: article,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: ArticaleItem(artical: article),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
