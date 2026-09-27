import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/core/l10n/app_localizations.dart';
import 'package:news/models/artical.dart';
import '../../../core/utils/url_launcher_helper.dart';

class ArticaleItem extends StatelessWidget {
  final Artical artical;
  const ArticaleItem({super.key, required this.artical});

  static String getTimeAgo(String publishedAt, AppLocalizations local) {
    final publishedDate = DateTime.parse(publishedAt);
    final now = DateTime.now();
    final difference = now.difference(publishedDate);

    if (difference.inSeconds < 60) {
      return local.seconds_ago(difference.inSeconds);
    }
    if (difference.inMinutes < 60) {
      return local.minutes_ago(difference.inMinutes);
    }
    if (difference.inHours < 24) {
      return local.hours_ago(difference.inHours);
    }
    if (difference.inDays < 7) {
      return local.days_ago(difference.inDays);
    }
    if (difference.inDays < 30) {
      return local.weeks_ago(difference.inDays ~/ 7);
    }
    if (difference.inDays < 365) {
      return local.months_ago(difference.inDays ~/ 30);
    }
    return local.years_ago(difference.inDays ~/ 365);
  }

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ArticleDetailsSheet(artical: artical),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => _showDetails(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: artical.urlToImage,
              imageBuilder: (context, imageProvider) => Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => SizedBox(
                width: double.infinity,
                height: 220,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => SizedBox(
                width: double.infinity,
                height: 220,
                child: Icon(Icons.error, size: 50),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              artical.title,
              style: theme.textTheme.headlineSmall!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.by_author(artical.author),
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  getTimeAgo(artical.publishedAt, local),
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDetailsSheet extends StatelessWidget {
  final Artical artical;
  const _ArticleDetailsSheet({required this.artical});

  String _cleanText(String? text, AppLocalizations local) {
    if (text == null || text.isEmpty) return local.no_additional_content;
    return text
        .replaceAll(RegExp(r'\[\+\d+ chars\]'), '')
        .replaceAll(r'\r\n', '\n')
        .trim();
  }

  Future<void> _openFullArticle(BuildContext context, AppLocalizations local) async {
    try {
      await launchArticleUrl(artical.url);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(local.could_not_open_article(e.toString()))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: .8,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: MediaQuery.of(context).viewPadding.bottom + 16,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: artical.urlToImage,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              height: 200,
                              color: Colors.white12,
                              child: const Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 200,
                              color: Colors.white12,
                              child: const Icon(Icons.image_not_supported, color: Colors.white54),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          artical.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _cleanText(artical.description, local),
                          style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _cleanText(artical.content, local),
                          style: const TextStyle(color: Colors.white54, fontSize: 13, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 12,
                    bottom: 16,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white12)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => _openFullArticle(context, local),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        local.view_full_article,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
