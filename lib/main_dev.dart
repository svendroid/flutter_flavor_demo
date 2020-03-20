import 'package:flutter/material.dart';
import 'flavor_demo_app.dart';

///Entrypoint for development flavor.
///Inject Flavor.DEV into App.
void main() {
  runApp(FlavorDemoApp(Flavor.DEV));
}
