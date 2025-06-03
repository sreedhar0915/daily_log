import 'package:daily_log/screen/daily_log/controller/dailylog_controller.dart';
import 'package:daily_log/screen/daily_log/screen/dailylog_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => DailylogController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DailylogScreen());
  }
}
