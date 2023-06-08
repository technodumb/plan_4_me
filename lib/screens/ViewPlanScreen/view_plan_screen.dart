import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:plan_4_me/provider/add_plan_provider.dart';
import 'package:plan_4_me/screens/PlanChatScreen/plan_chat_screen.dart';
import 'package:provider/provider.dart';

class ViewPlanScreen extends StatelessWidget {
  const ViewPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
        },
        child: Consumer<>(
          child: Scaffold(
            // draw a line after the appbar
            appBar: AppBar(
              title: const Text('Add Plan'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                  splashRadius: 20,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Title: ' + 
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
