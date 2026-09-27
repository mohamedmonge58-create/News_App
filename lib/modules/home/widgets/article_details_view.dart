import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/core/l10n/app_localizations.dart';
import 'package:news/models/artical.dart';
import 'package:news/modules/home/widgets/ArticaleItem.dart';
import '../../../core/utils/url_launcher_helper.dart';

class ArticleDetailsView extends StatelessWidget {
  final Artical artical;
  const ArticleDetailsView({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(local.article),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: artical.url,
                child: CachedNetworkImage(
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
                    ArticaleItem.getTimeAgo(artical.publishedAt, local),
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              if (artical.description.isNotEmpty) ...[
                Text(
                  _cleanText(artical.description, local),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
              ],
              Text(
                _cleanText(artical.content, local),
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.6),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _openFullArticle(context, local),
                  icon: const Icon(Icons.open_in_new),
                  label: Text(local.view_full_article),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
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

  String _cleanText(String? text, AppLocalizations local) {
    if (text == null || text.isEmpty) {
      return local.no_additional_content;
    }
    return text
        .replaceAll(RegExp(r'\[\+\d+ chars\]'), '')
        .replaceAll(r'\r\n', '\n')
        .trim();
  }
}
