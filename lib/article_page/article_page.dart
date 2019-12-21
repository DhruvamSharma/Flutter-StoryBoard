import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'article_pojo.dart';

class ArticlesPage extends StatelessWidget {
  final List<Article> articlesList = [
    Article(
        'https://medium.com/flutter-community/how-i-convinced-my-team-lead-to-go-for-flutter-and-kotlin-9e9bde16d73',
        'https://miro.medium.com/max/1170/0*gV7zMLrIY2A4kUys.jpg',
        'How I convinced my Team Lead to go for Flutter and Kotlin.'),
    Article(
        'https://medium.com/flutter-community/is-flutter-likely-to-replace-java-for-android-app-development-f9621f636fcf',
        'https://miro.medium.com/max/1440/1*Obp6D1vGgoIF7YPmZa06AQ.png',
        'How Flutter can be the future for your App development Process.'),
    Article(
        'https://medium.com/flutter-community/the-only-complete-and-latest-flutter-dive-a-complete-bliss-b4fc21005204',
        'https://miro.medium.com/max/1440/1*_dynm9TWtSzp7_hxUm9kBA.png',
        'The Only Complete and Latest Flutter Dive: A Complete Bliss.'),
    Article(
        'https://android.jlelse.eu/understanding-recyclerview-a-high-level-insight-part-1-dc3f81af5720',
        'https://miro.medium.com/max/1920/1*t9p4etzI6Wdh3A33i6d5Ig.jpeg',
        'Understanding RecyclerView. A high-level Insight. Part -1.'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width - 400,
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8,bottom: 8.0),
              child: Text(
                'Articles to read',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: articlesList.length,
              itemBuilder: (context, position) {
                return GestureDetector(
                  onTap: () async {
                    String url = articlesList[position].articleLink;
                    if (kIsWeb) {
                      html.window
                          .open(url, '_blank');
                    } else {
                      // TODO DO SOMETHING
                      if(await canLaunch(url)) {
                        launch(url);
                      }
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          articlesList[position].articleBannerImage,
                          height: 300,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 400 < 500? 300: 400,
                            child: Text(
                              articlesList[position].articleTitle,
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
