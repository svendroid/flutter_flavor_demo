import 'package:flutter/material.dart';
import 'flavor_demo_app.dart';

///Entrypoint for production flavor.
///Inject Flavor.PROD into App.
void main() {
  runApp(FlavorDemoApp(Flavor.PROD));
}
