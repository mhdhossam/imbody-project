import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../core/widgets/webView/webView_screen.dart';
import 'news_api_config/source_model.dart';
class ArticleDetails extends StatelessWidget {
  final ArticleModel articlesModel;
  final int index;
  const ArticleDetails({super.key, required this.articlesModel, required this.index});

  @override
  Widget build(BuildContext context) {
    String author = articlesModel.articles![index].author ?? '';
    String title = articlesModel.articles![index].title ?? '';
    String description = articlesModel.articles![index].description ?? '';
    String content = articlesModel.articles![index].content ?? '';
    String publishedAt = articlesModel.articles![index].publishedAt ?? '';
    String urlImage = articlesModel.articles![index].urlToImage ?? '';
    String url = articlesModel.articles![index].url ?? '';
    String source = articlesModel.articles![index].source!.name ?? '';
    String date = publishedAt.split('T')[0];
    //String time = publishedAt.split('T')[1].split('Z')[0];

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(15),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.primaryColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.primaryColor,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: urlImage,
                    // errorBuilder: (context, error, stackTrace) => SizedBox(height: 200, child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Icon(Icons.error),
                    //     Text('no image found', style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),)
                    //   ],
                    // )),
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Icons.article),
                  const SizedBox(width: 10),
                  Text('Source: $source',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 10),
                  Flexible(

                    child: Text(
                      'Author: $author',
                      maxLines: 5,
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 10),
                  Text( date,
                    style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(title,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 30),
              Text(description,
              style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              HtmlWidget(
                content,
                textStyle: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Back'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: ()  {
                      Get.to(() => WebViewScreen(url: url,source: source));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Row(
                      children: [
                        Text('Read full article'),
                        SizedBox(width: 5),
                        Icon(Icons.open_in_new),
                      ],
                    ),
                  ),
                ],
              ),
            ]
          )
        ),
      ),

    );
  }
}




