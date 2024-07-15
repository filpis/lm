import 'package:flutter/material.dart';
import 'package:lm/home/controllers/home_page_controller.dart';
import 'package:lm/home/widgets/button_widget.dart';
import 'package:lm/webview/pages/webview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomePageController();
    _controller.loading.addListener(_onStateChanged);
  }

  void _onStateChanged() {
    if (_controller.loading.value == HomePageState.success) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const WebViewPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<HomePageState>(
        valueListenable: _controller.loading,
        builder: (context, state, child) {
          return ButtonWidget(
            onTap: _controller.callWebView,
            isLoading: state == HomePageState.loading,
          );
        },
      ),
    );
  }
}
