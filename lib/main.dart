import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zrt_interview/view/search_screen.dart';

import 'data/data_binding/data_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
            getPages: [
        GetPage(
          name: '/',
          binding: DataBinding(),
          page: () => const SearchScreen(),
        ),
            ]
    );
  }
}

