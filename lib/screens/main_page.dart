import 'package:Indo_News/api/news_api.dart';
import 'package:Indo_News/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsApi newsApi = NewsApi();
  Future<Articles> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = newsApi.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.solidNewspaper),
        title: Text('Indo News'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              print(snapshot.data);
              return NewsList(articles: snapshot.data.articles);
            }
          }
        },
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  final List<Article> articles;

  const NewsList({Key key, this.articles}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles.length,
      itemBuilder: (BuildContext context, int index) {
        final title = widget.articles[index].title;
        // final description = widget.articles[index].description;
        final url = widget.articles[index].url;
        final urlToImage = widget.articles[index].urlToImage;
        return Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/detail',
              arguments: Article(url: url, title: title),
            ),
            child: Card(
              color: Colors.blueGrey[50],
              child: Column(
                children: <Widget>[
                  Image.network('$urlToImage'),
                  ListTile(
                    title: Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text('$title'),
                    ),
                    // subtitle: Container(
                    //   child: Text('$description'),
                    //   margin: EdgeInsets.only(bottom: 8.0),
                    // ),
                    trailing: IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        Share.share(
                          '$title\nlink: $url',
                          subject: 'Berita dari Indo News',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
