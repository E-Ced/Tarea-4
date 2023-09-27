import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/home_page.dart';
import 'package:tip_time/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider())
        ],
        child: HomePage(),
      ),
    );
  }
}
