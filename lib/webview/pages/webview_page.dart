import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  var isLoanding = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (e) {
        setState(() {
          isLoanding = false;
        });
      }))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://carrinhohml.lojadomecanico.com.br/login'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        isLoanding == true ? const Center(child: CircularProgressIndicator()) : const Stack()
      ],
    ));
  }
}
