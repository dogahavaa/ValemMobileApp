import 'package:flutter/material.dart';
//import 'package:valem_application/pages/register_page.dart';
import 'package:valem_application/router.dart';
//import 'package:valem_application/pages/account.dart';

void main() {
  runApp(const MyApp());
  //sds
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: homeRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFEC89A),
          background: const Color(0xFFF8EDEB),
          secondary: const Color(0xFFFFB5A7),
          primary: const Color(0xFFFEC89A),
        ),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Valem'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Image.asset(
          'lib/assets/images/Logo_With_Text.png',
          height: 36,
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/accountScreen');
              },
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 32,
              ))
        ],
      ),
      body: Scaffold(),
    );
  }
}
