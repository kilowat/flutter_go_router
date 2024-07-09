import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("News screen"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigation.of(context).push(NewsDetailRoute(id: '1'));
              },
              child: const Text('Push to news detail 1'),
            ),
          ],
        ),
      ),
    );
  }
}
