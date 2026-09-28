// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get news_app => 'الأخبار';

  @override
  String get go_to_home => 'الذهاب إلى الرئيسية';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'المظهر';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get good_morning_news => 'صباح الخير\nإليك بعض الأخبار لك';

  @override
  String get view_all => 'عرض الكل';

  @override
  String by_author(String author) {
    return 'بواسطة: $author';
  }

  @override
  String get article => 'مقال';

  @override
  String get view_full_article => 'عرض المقال كاملًا';

  @override
  String get no_additional_content => 'لا يوجد محتوى إضافي متاح.';

  @override
  String could_not_open_article(String error) {
    return 'تعذر فتح المقال: $error';
  }

  @override
  String get search => 'بحث';

  @override
  String get start_typing_to_search => 'ابدأ الكتابة للبحث عن الأخبار';

  @override
  String get no_results_found => 'لم يتم العثور على نتائج';

  @override
  String get something_went_wrong => 'حدث خطأ ما';

  @override
  String get supervised_by => 'تحت إشراف محمد منجه';

  @override
  String get category_general => 'عام';

  @override
  String get category_business => 'أعمال';

  @override
  String get category_sports => 'رياضة';

  @override
  String get category_health => 'صحة';

  @override
  String get category_entertainment => 'ترفيه';

  @override
  String get category_technology => 'تكنولوجيا';

  @override
  String get category_science => 'علوم';

  @override
  String seconds_ago(int count) {
    return 'منذ $count ثوانٍ';
  }

  @override
  String minutes_ago(int count) {
    return 'منذ $count دقائق';
  }

  @override
  String hours_ago(int count) {
    return 'منذ $count ساعات';
  }

  @override
  String days_ago(int count) {
    return 'منذ $count أيام';
  }

  @override
  String weeks_ago(int count) {
    return 'منذ $count أسابيع';
  }

  @override
  String months_ago(int count) {
    return 'منذ $count أشهر';
  }

  @override
  String years_ago(int count) {
    return 'منذ $count سنوات';
  }
}
