import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/core/l10n/app_localizations.dart';
import 'package:news/core/providerrr/settings.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_colors.dart';

class CustomDrawerWidget extends StatelessWidget {
  final void Function()? onHomeTap;
  const CustomDrawerWidget({super.key, this.onHomeTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final settings = context.watch<Settings>();
    final local = AppLocalizations.of(context);

    return Container(
      color: AppColors.primary,
      width: size.width * 0.75,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: Text(
              local!.news_app,
              style: theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.homeLogo),
                      SizedBox(width: 8),
                      Text(
                        local.go_to_home,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Divider(color: Colors.white),
                SizedBox(height: 24),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.rollerLogo),
                    SizedBox(width: 8),
                    Text(
                      local.theme,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomDropdown<String>(
                  onChanged: (value) {
                    if (value == local.light || value == 'Light') {
                      settings.changeThemeMode(ThemeMode.light);
                    } else if (value == local.dark || value == 'Dark') {
                      settings.changeThemeMode(ThemeMode.dark);
                    }
                  },
                  items: [local.light, local.dark],
                  initialItem: settings.currentThemeMode == ThemeMode.dark
                      ? local.dark
                      : local.light,
                  animation: const CustomDropdownAnimation(
                    type: DropdownAnimationType.scaleFade,
                    duration: Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    staggerItems: true,
                  ),
                  decoration: CustomDropdownDecoration(
                    closedFillColor: Colors.transparent,
                    closedBorder: Border.all(color: Colors.white, width: 1),
                    closedSuffixIcon: SvgPicture.asset(
                      AppAssets.polygonIcon,
                      width: 16,
                      height: 16,
                    ),
                    headerStyle: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Divider(color: Colors.white),
                SizedBox(height: 24),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.globeLogo),
                    SizedBox(width: 8),
                    Text(
                      local.language,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomDropdown<String>(
                  items: [local.english, local.arabic],
                  initialItem: settings.currentLocale.languageCode == 'ar'
                      ? local.arabic
                      : local.english,
                  animation: const CustomDropdownAnimation(
                    type: DropdownAnimationType.scaleFade,
                    duration: Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    staggerItems: true,
                  ),
                  decoration: CustomDropdownDecoration(
                    closedFillColor: Colors.transparent,
                    closedBorder: Border.all(color: Colors.white, width: 1),
                    closedSuffixIcon: SvgPicture.asset(
                      AppAssets.polygonIcon,
                      width: 16,
                      height: 16,
                    ),
                    headerStyle: theme.textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    if (value == local.arabic || value == 'Arabic') {
                      settings.changeLocale(const Locale('ar'));
                    } else if (value == local.english || value == 'English') {
                      settings.changeLocale(const Locale('en'));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
