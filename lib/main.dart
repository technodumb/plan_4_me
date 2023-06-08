import 'package:flutter/material.dart';
import 'package:plan_4_me/provider/chat_screen_provider.dart';
import 'package:provider/provider.dart';

import 'provider/add_plan_provider.dart';
import 'routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddPlanProvider>(
          create: (context) => AddPlanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatScreenProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: routes,
        theme: ThemeData(
          primaryTextTheme: Typography.whiteMountainView,
          textTheme: Typography.whiteMountainView,
          scaffoldBackgroundColor: const Color(0xFF040313),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF040313),
          ),
        ),
        // home: Scaffold(
        //   body: Center(
        //       // child: Text('Hello World!'),
        //       ),
        // ),
      ),
    );
  }
}
