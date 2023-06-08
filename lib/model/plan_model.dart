import 'message_model.dart';
import 'subplan_model.dart';

class PlanModel {
  String planID;
  String planName;
  String planDescription;
  String planDate;
  String planTime;
  List<SubplanModel> subPlans;
  bool isHighPriority;
  List<String> suggestions;
  List<MessageModel> messageList;
  bool isCompleted;

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
    this.isCompleted = false,
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
        suggestions = json['suggestions'],
        isCompleted = json['isCompleted'];

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
        'isCompleted': isCompleted,
      };

  factory PlanModel.newPlan() {
    return PlanModel(
      planID: '',
      planName: '',
      planDescription: '',
      planDate: '',
      planTime: '',
      isHighPriority: false,
    );
  }
}
