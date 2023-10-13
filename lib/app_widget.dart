import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest2/data/http/http_client.dart';
import 'package:flutter_api_rest2/pages/home/home_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return MultiProvider(
      providers: [
        Provider<Dio>.value(value: dio), // Forneça a instância do Dio
        ProxyProvider<Dio, DioClient>(
          update: (context, dio, dioClient) {
            return DioClient(
                dio); // Crie a instância do DioClient com o Dio fornecido
          },
        ),
      ],
      child: const MaterialApp(
        title: 'Demonstração',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
