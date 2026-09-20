import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news/modules/home/widgets/ArticaleItem.dart';
import '../view_model/search_view_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final vm = context.watch<SearchViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: context.read<SearchViewModel>().queryChanged,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _controller.clear();
                          context.read<SearchViewModel>().queryChanged('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildBody(vm, theme)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(SearchViewModel vm, ThemeData theme) {
    switch (vm.status) {
      case SearchStatus.initial:
        return Center(
          child: Text(
            "Start typing to search for news",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        );
      case SearchStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case SearchStatus.empty:
        return Center(
          child: Text(
            "No results found",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        );
      case SearchStatus.error:
        return Center(child: Text(vm.errorMessage ?? "Something went wrong"));
      case SearchStatus.success:
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: vm.results.length,
          itemBuilder: (context, index) =>
              ArticaleItem(artical: vm.results[index]),
        );
    }
  }
}
