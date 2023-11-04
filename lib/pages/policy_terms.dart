import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PolicyTerms extends StatelessWidget {
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
