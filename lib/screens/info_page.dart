import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indo News'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage('images/profile.jpeg'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Indo News App',
              style: TextStyle(fontSize: 28.0),
            ),
            Text(
              'Ver 0.0.1',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Developed by Rizki M.',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'powered by NewsAPI.org',
            ),
          ],
        ),
      ),
    );
  }
}
