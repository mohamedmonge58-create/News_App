
import 'package:url_launcher/url_launcher.dart';

Future<void> launchArticleUrl(String url) async {
  final uri = Uri.tryParse(url);

  if (uri == null ||
      (uri.scheme != 'https' && uri.scheme != 'http') ||
      uri.host.isEmpty) {
    throw Exception('Invalid article URL: $url');
  }

  final launched = await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );

  if (!launched) {
    throw Exception('Could not open article URL: $url');
  }
}
