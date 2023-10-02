import 'package:flutter/material.dart';
import 'package:flutter_api_rest2/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demonstração',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
