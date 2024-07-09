import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigation.of(context).pop();
            },
            child: Text('back'),
          ),
        ),
      ),
    );
  }
}
