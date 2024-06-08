import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../news_api_config/source_model.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel articlesModel;
  final int index;
  final Function onTap;

  const ArticleWidget({super.key , required this.articlesModel,required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String title = articlesModel.articles![index].title ?? '';
    bool isHaveImage = articlesModel.articles![index].urlToImage == null ? false : true;
    String author = articlesModel.articles![index].source!.name ?? 'Unknown';
    String urlImage = articlesModel.articles![index].urlToImage ?? '';
    String? date = articlesModel.articles![index].publishedAt?.split('T')[0];
    String? time = articlesModel.articles![index].publishedAt?.split('T')[1].split('Z')[0];

    var theme = Theme.of(context );
    return isHaveImage?  GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.primaryColor,
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
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.primaryColor,
                ),
                child: CachedNetworkImage(
                  imageUrl: urlImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // errorBuilder: (context, error, stackTrace) => const SizedBox(height: 200, child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Icon(Icons.error),
                  //     Text('Error Loading image')
                  //   ],
                  // )),),
              )
            )),
            const SizedBox(height: 15),
            Text(
              author,
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 15,
              ),

            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date!,
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 15,
                      ),

                    ),
                    Text(
                      time!,
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 15,
                      ),

                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(onPressed: () {
                  onTap();
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Read Details'),
                )
              ],
            ),
          ]
        ),
      ),
    ) : const SizedBox.shrink() ;
  }
}
