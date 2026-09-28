// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get news_app => 'News App';

  @override
  String get go_to_home => 'Go To Home';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get good_morning_news => 'Good Morning \nHere is Some News For You';

  @override
  String get view_all => 'View All';

  @override
  String by_author(String author) {
    return 'By: $author';
  }

  @override
  String get article => 'Article';

  @override
  String get view_full_article => 'View Full Article';

  @override
  String get no_additional_content => 'No additional content available.';

  @override
  String could_not_open_article(String error) {
    return 'Couldn\'t open the article: $error';
  }

  @override
  String get search => 'Search';

  @override
  String get start_typing_to_search => 'Start typing to search for news';

  @override
  String get no_results_found => 'No results found';

  @override
  String get something_went_wrong => 'Something went wrong';

  @override
  String get supervised_by => 'Supervised by Mohamed Monge';

  @override
  String get category_general => 'General';

  @override
  String get category_business => 'Business';

  @override
  String get category_sports => 'Sports';

  @override
  String get category_health => 'Health';

  @override
  String get category_entertainment => 'Entertainment';

  @override
  String get category_technology => 'Technology';

  @override
  String get category_science => 'Science';

  @override
  String seconds_ago(int count) {
    return '$count seconds ago';
  }

  @override
  String minutes_ago(int count) {
    return '$count minutes ago';
  }

  @override
  String hours_ago(int count) {
    return '$count hours ago';
  }

  @override
  String days_ago(int count) {
    return '$count days ago';
  }

  @override
  String weeks_ago(int count) {
    return '$count weeks ago';
  }

  @override
  String months_ago(int count) {
    return '$count months ago';
  }

  @override
  String years_ago(int count) {
    return '$count years ago';
  }
}
