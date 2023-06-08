class MessageModel {
  String message;
  bool sent;
  String planID;
  MessageModel(
      {required this.message, required this.sent, required this.planID});

  MessageModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        sent = json['sent'],
        planID = json['planID'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'sent': sent,
        'planID': planID,
      };
}
