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
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
    // questionIndex++;
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

  set questionList(List<String> questionList) {
    _questionList.addAll(questionList);
    notifyListeners();
  }
}
