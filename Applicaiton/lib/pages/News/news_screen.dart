import 'package:fitgenie/pages/News/news_api_config/news_api_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'news_api_config/source_model.dart';
import 'news_details_view_screen.dart';
import 'news_widget/artical_widget_view.dart';

class NewsView extends StatefulWidget {
  static const String routeName = '/news_screen';
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FutureBuilder(
        future: NewsApiManger.fetchSource(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error Check your connection'),
                    SizedBox(width: 10),
                    Icon(
                      Icons.wifi_off,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () {
                    setState(() {
                      NewsApiManger.fetchSource();
                    });
                  },
                  icon: const Icon(Icons.refresh_sharp),
                )
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading...', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            ArticleModel articlesModel = snapshot.data as ArticleModel;
            return RefreshIndicator(
              color: theme.primaryColor,
              backgroundColor: theme.colorScheme.background,
              onRefresh: () async {
                setState(() {
                  NewsApiManger.fetchSource();
                });
              },
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                controller: ScrollController(),
                itemCount: articlesModel.articles!.length > 30
                    ? 30
                    : articlesModel.articles!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ArticleWidget(
                    onTap: () {
                      Get.to(
                        () => ArticleDetails(
                          articlesModel: articlesModel,
                          index: index,
                        ),
                        transition: Transition.rightToLeft,
                      );
                    },
                    articlesModel: articlesModel,
                    index: index,
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('No data found'),
            );
          }
        });
  }
}
