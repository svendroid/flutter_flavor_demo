import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

/// The different flavors of the application
enum Flavor { DEV, PROD }

/// Main app class which takes a flavor as input
class FlavorDemoApp extends StatelessWidget {
  final Flavor flavor;

  FlavorDemoApp(this.flavor, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flavor Demo',
      home: FlavorPage(
        flavor: this.flavor,
      ),
    );
  }
}

/// Displays the given flavor in the middle of the page and colors
/// the background green for dev flavor and red for prod flavor.
class FlavorPage extends StatefulWidget {
  final Flavor flavor;

  FlavorPage({Key key, this.flavor}) : super(key: key);

  @override
  _FlavorPageState createState() => _FlavorPageState();
}

class _FlavorPageState extends State<FlavorPage> {
  String packageName = "";

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        packageName = packageInfo.packageName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: _backgroundColor(),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch,children: [
        Text(
          "The current flavor is:\n ${widget.flavor}",
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "packageName:\n$packageName",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        )
      ]),
    ));
  }

  Color _backgroundColor() {
    if (widget.flavor == Flavor.DEV) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }
}
