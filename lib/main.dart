import 'package:flutter/material.dart';
import 'package:uts/route.dart';

void main() {
  runApp(const MaterialApp(
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
