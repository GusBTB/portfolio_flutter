import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/providers/projects_provider.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProjectsProvider()),
    ],
    child: const MyApp(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(149, 113, 177, 1),

        // Define the default font family.
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(149, 13, 177, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
