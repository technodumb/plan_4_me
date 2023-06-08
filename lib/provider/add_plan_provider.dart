import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plan_4_me/model/plan_model.dart';
import 'package:http/http.dart' as http;

class AddPlanProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool _highPriority = false;
  DateTime _pickedDate = DateTime.now();
  TimeOfDay _pickedTime = TimeOfDay.now();

  PlanModel planModel = PlanModel.newPlan();
  http.Response addPlanResponse = http.Response('', 800);

  bool get highPriority => _highPriority;
  DateTime get pickedDate => _pickedDate;
  TimeOfDay get pickedTime => _pickedTime;

  void togglePriority() {
    _highPriority = !_highPriority;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _pickedDate = date;
    dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    notifyListeners();
  }

  void setTime(TimeOfDay time, BuildContext context) {
    _pickedTime = time;
    final localizations = MaterialLocalizations.of(context);
    // final formattedTimeOfDay =
    timeController.text = localizations.formatTimeOfDay(_pickedTime);
    notifyListeners();
  }

  Future<void> addingPlan() async {
    planModel.planName = titleController.text;
    planModel.planDescription = descriptionController.text;
    planModel.planDate = dateController.text;
    planModel.planTime = timeController.text;
    planModel.isHighPriority = _highPriority;
    planModel.planID = DateTime.now().millisecondsSinceEpoch.toString();
    addPlanResponse = await sendPostReq();

    notifyListeners();
  }

  Future<http.Response> sendPostReq() {
    return http.post(
      Uri.parse('http://127.0.0.1:5000/add_plan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(planModel.toJson()),
    );
  }
}
