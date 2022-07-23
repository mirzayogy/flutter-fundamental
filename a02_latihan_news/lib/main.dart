import 'package:a02_latihan_news/article_webview.dart';
import 'package:a02_latihan_news/detail_page.dart';
import 'package:a02_latihan_news/model/article.dart';
import 'package:a02_latihan_news/styles.dart';
import 'package:flutter/material.dart';

import 'list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        // textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        ArticleDetailPage.routeName: ((context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article)),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
