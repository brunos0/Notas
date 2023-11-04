import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PolicyTerms extends StatelessWidget {
  //final String url;

  const PolicyTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.google.com",
      appBar: AppBar(
        title: const Text("Policy Terms"),
      ),
    );
  }
}
