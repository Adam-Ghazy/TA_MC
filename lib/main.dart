import 'package:flutter/material.dart';
import 'package:masbro_canteen/provider/auth_provider.dart';
import 'package:masbro_canteen/views/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
