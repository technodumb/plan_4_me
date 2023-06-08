import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plan_4_me/model/message_model.dart';
import 'package:plan_4_me/provider/add_plan_provider.dart';
import 'package:plan_4_me/provider/chat_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PlanChatScreen extends StatelessWidget {
  const PlanChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ChatScreenProvider, AddPlanProvider>(
      builder: (context, chatScreenProvider, addPlanProvider, child) {
        chatScreenProvider.initPage();
        return Scaffold(
          appBar: AppBar(
            title: Text('Title'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                splashRadius: 20,
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // scroll to the bottom of this list when the page opens and when a new message is sent
                child: SingleChildScrollView(
                  controller: chatScreenProvider.scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          // add a widget as the first element of the following list
                          <Widget>[
                                Text(
                                  'Plan Name: ' +
                                      addPlanProvider.planModel.planName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                Text(
                                  'Plan Description: ' +
                                      addPlanProvider.planModel.planDescription,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Answer the following questions to get a plan\n' +
                                        ' The more you answer, the better we know your requirements\n' +
                                        "If you're done, press submit",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ] +
                              // add a widget as the last element of the following list
                              chatScreenProvider.messages
                                  .map((message) =>
                                      PlanChatMessage(message: message))
                                  .toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // dejsonify the addPlanResponse.body
                        var jsons =
                            jsonDecode(addPlanProvider.addPlanResponse.body);
                        print(jsons['questions'][0]);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: const Size(40, 40),
                        // circular shape
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),

                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      // splashRadius: 20,
                      // padding: EdgeInsets.zero,
                      // visualDensity: VisualDensity.compact,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        // margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          controller: chatScreenProvider.textFieldController,
                          minLines: 1,
                          maxLines: 5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () async {
                        if (chatScreenProvider
                            .textFieldController.text.isEmpty) {
                          return;
                        }
                        chatScreenProvider.addToAnswerList();
                        chatScreenProvider.addMessage(
                          MessageModel(
                            message:
                                chatScreenProvider.textFieldController.text,
                            sent: true,
                            planID: addPlanProvider.planModel.planID,
                          ),
                        );
                        chatScreenProvider.textFieldController.clear();
                        // sleep for 1 second
                        await Future.delayed(const Duration(seconds: 1));
                        if (chatScreenProvider.questionIndex < 10) {
                          chatScreenProvider.addMessage(
                            MessageModel(
                              message: chatScreenProvider.questionList[
                                  chatScreenProvider.questionIndex++],
                              sent: false,
                              planID: addPlanProvider.planModel.planID,
                            ),
                          );
                        } else {
                          http.Response s =
                              await chatScreenProvider.recieveSummaryViaPOST();
                          print(s.body);
                          chatScreenProvider.addMessage(
                            MessageModel(
                              message: 'Thank you for your time',
                              sent: false,
                              planID: addPlanProvider.planModel.planID,
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PlanChatMessage extends StatelessWidget {
  final MessageModel message;
  const PlanChatMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: message.sent ? Alignment.centerRight : Alignment.centerLeft,
      padding: message.sent
          ? const EdgeInsets.only(left: 30)
          : const EdgeInsets.only(right: 30),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF191919),
          border: Border.all(
            color: Color(0xFF595959),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.message,
          style: TextStyle(fontSize: 19),
          maxLines: 10,
        ),
      ),
    );
  }
}
