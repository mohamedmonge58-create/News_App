import 'package:flutter/material.dart';
import 'package:news/core/l10n/app_localizations.dart';
import 'package:news/models/category_model.dart';
import 'package:provider/provider.dart';

import '../../../core/providerrr/settings.dart';
import '../view_model/home_view_model.dart';

class CategoryCardItem extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  const CategoryCardItem({
    super.key,
    required this.index,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    final vm = Provider.of<HomeViewModel>(context);
    final settings = context.watch<Settings>();
    return Container(

      width: double.infinity,
      height: 195,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: settings.currentThemeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          alignment:index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
          image: AssetImage(categoryModel.imagePath),
          fit: BoxFit.contain,
        ),
      ),
      child: Directionality(
        textDirection: index % 2 == 0 ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vm.getCategoryName(categoryModel.id, local!),
              style: theme.textTheme.headlineSmall!.copyWith(
                color: settings.currentThemeMode == ThemeMode.dark ? Colors.black : Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(84),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: settings.currentThemeMode == ThemeMode.dark ? Colors.black : Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 30,
                      color: settings.currentThemeMode == ThemeMode.dark ? Colors.white : Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      local.view_all,
                      style: theme.textTheme.headlineSmall ?.copyWith(

                        color: settings.currentThemeMode == ThemeMode.dark ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,


                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
