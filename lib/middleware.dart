import 'package:flutter/material.dart';
import 'package:flutter_application_1/router.dart';
import 'package:go_router/go_router.dart';

Future<String?> authMiddleware(BuildContext context, GoRouterState state) {
  //return Future.value(null);
  return Future.value(AuthRoute().location);
}
