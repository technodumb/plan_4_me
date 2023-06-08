import 'package:flutter/material.dart';
import 'screens/AddPlanScreen/add_plan_screen.dart';
import 'screens/HomeScreen/home_screen.dart';
import 'screens/LoginScreen/login_screen.dart';
import 'screens/PlanChatScreen/plan_chat_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/add_plan': (context) => const AddPlanScreen(),
  '/chat_screen': (context) => const PlanChatScreen(),
};
