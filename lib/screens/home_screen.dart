import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          padding: const EdgeInsets.all(20),
          color: Colors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigation.of(context).push(AuthRoute());
                },
                child: Text("Got to auth"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigation.of(context).push(NewsDetailRoute(id: '1'));
                },
                child: Text("Push detail news"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
