import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'models/magnitudeprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MagnitudeProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
