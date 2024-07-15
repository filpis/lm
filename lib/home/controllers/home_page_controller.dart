import 'package:flutter/material.dart';

enum HomePageState { initial, loading, success, failed }

class HomePageController {
  final ValueNotifier<HomePageState> loading = ValueNotifier<HomePageState>(HomePageState.initial);
  Future<void> callWebView() async {
    loading.value = HomePageState.loading;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = HomePageState.success;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   loading.value = HomePageState.success;
    // });
  }
}
