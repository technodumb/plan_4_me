import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:plan_4_me/model/message_model.dart';
import 'package:plan_4_me/provider/add_plan_provider.dart';
import 'package:plan_4_me/provider/chat_screen_provider.dart';
import 'package:plan_4_me/screens/PlanChatScreen/plan_chat_screen.dart';
import 'package:provider/provider.dart';

class AddPlanScreen extends StatelessWidget {
  const AddPlanScreen({super.key});

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
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer<AddPlanProvider>(
              builder:
                  (BuildContext context, addPlanController, Widget? child) {
                return Form(
                  child: Column(
                    children: [
                      // horizontal line
                      Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF191919),
                          border: Border.all(color: const Color(0xFF443939)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: addPlanController.titleController,
                          decoration: InputDecoration(
                            hintText: 'Title of the plan',
                            hintStyle:
                                const TextStyle(color: Color(0x7FFFFFFF)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF191919),
                                border:
                                    Border.all(color: const Color(0xFF443939)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                enabled: false,
                                controller: addPlanController.timeController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'HH:MM',
                                  hintStyle:
                                      const TextStyle(color: Color(0x7FFFFFFF)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () async {
                              // open a calendar
                              // DateTime selectedDate = await showDatePicker(
                              //       context: context,
                              //       initialDate:
                              //           addPlanController.pickedDate,
                              //       firstDate: DateTime(2000),
                              //       lastDate: DateTime(2100),
                              //     ) ??
                              //     DateTime.now();
                              TimeOfDay selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ) ??
                                  TimeOfDay.now();
                              addPlanController.setTime(selectedTime);
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, minimumSize: Size.zero
                                // visualDensity: VisualDensity.compact,
                                ),
                            child: Container(
                              height: 40,
                              width: 45,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF191919),
                                border:
                                    Border.all(color: const Color(0xFF443939)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                // add iconly calendar
                                IconlyBold.time_circle,
                                color: Color(0x9CFFFFFF),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 45,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF191919),
                              border:
                                  Border.all(color: const Color(0xFF443939)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              // sparkling icon
                              IconlyBold.star,
                              color: Color(0x9CFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF191919),
                                border:
                                    Border.all(color: const Color(0xFF443939)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                enabled: false,
                                controller: addPlanController.dateController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'DD/MM/YYYY',
                                  hintStyle:
                                      const TextStyle(color: Color(0x7FFFFFFF)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () async {
                              // open a calendar
                              DateTime selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: addPlanController.pickedDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  ) ??
                                  DateTime.now();
                              addPlanController.setDate(selectedDate);
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, minimumSize: Size.zero
                                // visualDensity: VisualDensity.compact,
                                ),
                            child: Container(
                              height: 40,
                              width: 45,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF191919),
                                border:
                                    Border.all(color: const Color(0xFF443939)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                // add iconly calendar
                                IconlyBold.calendar, color: Color(0x9CFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        // height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF191919),
                          border: Border.all(color: const Color(0xFF443939)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          maxLines: 10,
                          minLines: 3,
                          controller: addPlanController.descriptionController,
                          decoration: InputDecoration(
                              hintText:
                                  'Tell us more about your plan (optional)',
                              hintStyle:
                                  const TextStyle(color: Color(0x7FFFFFFF)),
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.white))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Priority:',
                            style: TextStyle(
                                color: Color(
                                  0x66FFFFFF,
                                ),
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          TogglePriority(),
                          SizedBox()
                        ],
                      ),
                      Spacer(),
                      Consumer<ChatScreenProvider>(
                          builder: (context, chatScreenProvider, child) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            // print((await addPlanController.sendPostReq()).body);
                            try {
                              // await addPlanController.addingPlan();
                              // add a spinnning circle till the response is back
                              if (!addPlanController.gotQuestions) {
                                await addPlanController.addingPlan();
                              }
                            } catch (e) {
                              // print(e);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Cannot connect to the server'),
                                ),
                              );
                              return;
                            }
                            int status =
                                addPlanController.addPlanResponse.statusCode;
                            if (status != 200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Something went wrong'),
                                ),
                              );
                              return;
                            }
                            //  chatScreenController context.read
                            addPlanController.gotQuestions = true;
                            chatScreenProvider.questionList.clear();
                            chatScreenProvider.answerList.clear();
                            chatScreenProvider.questionList = List<String>.from(
                                jsonDecode(addPlanController.addPlanResponse
                                    .body)['questions'] as List);
                            chatScreenProvider.questionIndex = 1;
                            chatScreenProvider.messages.clear();
                            chatScreenProvider.messages.add(
                              MessageModel(
                                message: chatScreenProvider.questionList[0],
                                sent: false,
                                planID: addPlanController.planModel.planID,
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlanChatScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: const Color(0xFF191919),
                              gradient: const LinearGradient(colors: [
                                Color(0xFF277613),
                                Color(0x00000000)
                              ]),
                              border:
                                  Border.all(color: const Color(0xFF595959)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Proceed',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TogglePriority extends StatelessWidget {
  // final bool isHighPriority;
  const TogglePriority({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isHighPriority = context.read<AddPlanProvider>().highPriority;
    return Consumer<AddPlanProvider>(
      builder: (context, value, child) {
        bool isHighPriority = value.highPriority;
        return TextButton(
          onPressed: () {
            // toggle priority
            value.togglePriority();
            // print(context.read<AddPlanProvider>().highPriority);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: const Color(0xFF443939)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                _buildPriorityContainer(
                  'Low',
                  isHighPriority ? Colors.white : Color(0xFF31F700),
                ),
                _buildPriorityContainer(
                    'High', isHighPriority ? Colors.red : Colors.white,
                    lightText: isHighPriority),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPriorityContainer(String text, Color color,
      {bool lightText = false}) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(color: lightText ? Colors.white : Colors.black),
      ),
    );
  }
}
