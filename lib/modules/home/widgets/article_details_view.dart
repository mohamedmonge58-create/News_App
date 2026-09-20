import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/models/artical.dart';
import 'package:news/modules/home/widgets/ArticaleItem.dart';
import '../../../core/utils/url_launcher_helper.dart';

class ArticleDetailsView extends StatelessWidget {
  final Artical artical;
  const ArticleDetailsView({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
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
                    "By: ${artical.author}",
                    style: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    ArticaleItem.getTimeAgo(artical.publishedAt),
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
                  _cleanText(artical.description),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
              ],
              Text(
                _cleanText(artical.content),
                style: theme.textTheme.bodyMedium!.copyWith(height: 1.6),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _openFullArticle(context),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text("View Full Article"),
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

  Future<void> _openFullArticle(BuildContext context) async {
    try {
      await launchArticleUrl(artical.url);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Couldn't open the article: $e")),
        );
      }
    }
  }

  String _cleanText(String? text) {
    if (text == null || text.isEmpty) {
      return "No additional content available.";
    }
    return text
        .replaceAll(RegExp(r'\[\+\d+ chars\]'), '')
        .replaceAll(r'\r\n', '\n')
        .trim();
  }
}