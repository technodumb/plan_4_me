class SubplanModel {
  String subplanIndex;
  String subplanTitle;
  String subplanDescription;
  String subplanDate;
  String subplanTime;
  bool isCompleted;

  SubplanModel({
    required this.subplanIndex,
    required this.subplanTitle,
    required this.subplanDescription,
    required this.subplanDate,
    required this.subplanTime,
    this.isCompleted = false,
  });

  SubplanModel.fromJson(Map<String, dynamic> json)
      : subplanIndex = json['subplanIndex'],
        subplanTitle = json['subplanTitle'],
        subplanDescription = json['subplanDescription'],
        subplanDate = json['subplanDate'],
        subplanTime = json['subplanTime'],
        isCompleted = json['isCompleted'];

  Map<String, dynamic> toJson() => {
        'subplanIndex': subplanIndex,
        'subplanTitle': subplanTitle,
        'subplanDescription': subplanDescription,
        'subplanDate': subplanDate,
        'subplanTime': subplanTime,
        'isCompleted': isCompleted,
      };

  factory SubplanModel.newSubplan() {
    return SubplanModel(
      subplanIndex: '',
      subplanTitle: '',
      subplanDescription: '',
      subplanDate: '',
      subplanTime: '',
      isCompleted: false,
    );
  }
}
