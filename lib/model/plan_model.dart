import 'package:plan_4_me/model/message_model.dart';

class PlanModel {
  String planID;
  String planName;
  String planDescription;
  String planDate;
  String planTime;
  List<PlanModel> subPlans;
  bool isHighPriority;
  List<String> suggestions;
  List<MessageModel> messageList;

  PlanModel({
    required this.planID,
    required this.planName,
    required this.planDescription,
    required this.planDate,
    required this.planTime,

    // required this.planTime,
    this.messageList = const [],
    this.subPlans = const [],
    this.suggestions = const [],
    required this.isHighPriority,
  });

  PlanModel.fromJson(Map<String, dynamic> json)
      : planID = json['planID'],
        planName = json['planName'],
        planDescription = json['planDescription'],
        planDate = json['planDate'],
        planTime = json['planTime'],
        messageList = json['messageList'],
        isHighPriority = json['isHighPriority'],
        subPlans = json['subPlans'],
        suggestions = json['suggestions'];

  Map<String, dynamic> toJson() => {
        'planID': planID,
        'planName': planName,
        'planDescription': planDescription,
        'planDate': planDate,
        'planTime': planTime,
        'messageList': messageList,
        'isHighPriority': isHighPriority,
        'subPlans': subPlans,
        'suggestions': suggestions,
      };

  factory PlanModel.newPlan() {
    return PlanModel(
      planID: '',
      planName: '',
      planDescription: '',
      planDate: '',
      planTime: '',
      messageList: [],
      isHighPriority: false,
      subPlans: [],
      suggestions: [],
    );
  }
}
