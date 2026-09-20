import 'package:url_launcher/url_launcher.dart';

Future<void> launchArticleUrl(String url) async {
  final uri = Uri.parse(url);

  final canLaunch = await canLaunchUrl(uri);
  if (!canLaunch) {
    throw Exception('Could not launch $url');
  }

  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );
}