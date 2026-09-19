import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/artical.dart';

class ArticaleItem extends StatelessWidget {
  final Artical artical;
  const ArticaleItem({super.key, required this.artical});

  String getTimeAgo(String publishedAt) {
    final publishedDate = DateTime.parse(publishedAt);
    final now = DateTime.now();

    final difference = now.difference(publishedDate);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    if (difference.inDays < 30) {
      return '${difference.inDays ~/ 7} weeks ago';
    }

    if (difference.inDays < 365) {
      return '${difference.inDays ~/ 30} months ago';
    }

    return '${difference.inDays ~/ 365} years ago';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
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
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.red,
                    BlendMode.colorBurn,
                  ),
                ),
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
          Text(
            artical.title,
            style: theme.textTheme.headlineSmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By: ${artical.author}",
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Text(
                getTimeAgo(artical.publishedAt),
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}