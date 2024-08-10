import 'package:flutter/material.dart';
import 'page_1.dart';
import 'page_2.dart';
import 'page_3.dart';
import 'page_4.dart';
// import 'page_4.dart'; // Commented out the import statement for 'page_4.dart'

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task-6',
      initialRoute: "/page_2",
      debugShowCheckedModeBanner: false,
      routes: {"/page_2": (BuildContext context) => const Page2()},
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
