import 'package:plan_4_me/model/plan_model.dart';

class UserModel {
  String userID;
  String userName;
  String userEmail;
  String userImage;

  List<PlanModel> userPlans;

  UserModel({
    required this.userID,
    required this.userName,
    required this.userEmail,
    required this.userImage,
    this.userPlans = const [],
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : userID = json['userID'],
        userName = json['userName'],
        userEmail = json['userEmail'],
        userImage = json['userImage'],
        userPlans = json['userPlans'];

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'userEmail': userEmail,
        'userImage': userImage,
        'userPlans': userPlans,
      };
}
