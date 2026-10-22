import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/core/providerrr/settings.dart';
import 'package:provider/provider.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_colors.dart';

class CustomDrawerWidget extends StatelessWidget {
  final void Function()? onHomeTap;
  const CustomDrawerWidget({super.key , this.onHomeTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final settings = context.watch<Settings>();
    final l10n = AppLocalizations.of(context)!;
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
              l10n.news_app,

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
                  onTap: onHomeTap,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.homeLogo),
                      SizedBox(width: 8),
                      Text(
                        l10n.go_to_home,                        style: theme.textTheme.titleLarge!.copyWith(
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
                      l10n.theme,
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
                  items: ['Light', 'Dark'],
                  initialItem: settings.currentThemeMode == ThemeMode.dark ? 'Dark' : 'Light',
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
                    if (value == 'Dark') {
                      settings.changeThemeMode(ThemeMode.dark);
                    } else {
                      settings.changeThemeMode(ThemeMode.light);
                    }
                  },
                ),

                SizedBox(height: 24),
                Divider(color: Colors.white),
                SizedBox(height: 24),

                Row(
                  children: [
                    SvgPicture.asset(AppAssets.globeLogo),
                    SizedBox(width: 8),
                    Text(
                      l10n.language,
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
                  items: [
                    l10n.english,
                    l10n.arabic,
                  ],
                  initialItem: settings.currentLocale.languageCode == 'ar'
                      ? l10n.arabic
                      : l10n.english,
                  animation: const CustomDropdownAnimation(
                    type: DropdownAnimationType.scaleFade,
                    duration: Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    staggerItems: true,
                  ),
                  decoration: CustomDropdownDecoration(
                    closedFillColor: Colors.transparent,
                    closedBorder: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
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
                    if (value == l10n.arabic) {
                      settings.changeLocale(const Locale('ar'));
                    } else if (value == l10n.english) {
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