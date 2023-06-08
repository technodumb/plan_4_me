import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:plan_4_me/model/message_model.dart';

class ChatScreenProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  final List<String> _questionList = [];
  final List<String> _answerList = [];
  int questionIndex = 0;
  get scrollController => _scrollController;

  void initPage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  final _textFieldController = TextEditingController();
  final List<MessageModel> _messages = [];
  bool _submitButtonExpanded = false;

  List<MessageModel> get messages => _messages;
  get textFieldController => _textFieldController;

  void addMessage(MessageModel message) {
    _messages.add(message);
    notifyListeners();
  }

  void toggleSubmitButton() {
    _submitButtonExpanded = !_submitButtonExpanded;
    notifyListeners();
  }

  List<String> get questionList => _questionList;
  List<String> get answerList => _answerList;

  set questionList(List<String> questionList) {
    _questionList.addAll(questionList);
    notifyListeners();
  }

  void addToAnswerList() {
    _answerList.add(_textFieldController.text);
    notifyListeners();
  }

  Future<http.Response> recieveSummaryViaPOST() {
    String questionsAndAnswers = '';
    for (int i = 0; i < questionList.length; i++) {
      questionsAndAnswers =
          "$questionsAndAnswers${questionList[i]} : ${answerList[i]} \n";
    }
    return http.post(
      Uri.parse('http://127.0.0.1:5000/summarize'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'qna': questionsAndAnswers}),
    );
  }
}
