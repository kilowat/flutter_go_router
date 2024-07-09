import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News detail screen $id'),
        ),
        body: Container(
          child: Column(
            children: [
              Text('News detail $id'),
              ElevatedButton(
                onPressed: () {
                  Navigation.of(context).push(AuthRoute());
                },
                child: Text('auth'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigation.of(context).back();
                },
                child: Text('back'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigation.of(context).push(NewsRoute());
                },
                child: Text('news'),
              ),
            ],
          ),
        ));
  }
}
