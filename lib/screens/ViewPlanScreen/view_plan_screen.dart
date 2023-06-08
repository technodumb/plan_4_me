import 'package:flutter/material.dart';

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
              children: [Text('Title: ')],
            ),
          ),
        ),
      ),
    );
  }
}
