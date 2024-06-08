class HealthDataModelCalories {
  List<CaloriesExpended>? caloriesExpended;

  HealthDataModelCalories({this.caloriesExpended});

  HealthDataModelCalories.fromJson(Map<String, dynamic> json) {
    if (json['calories_expended'] != null) {
      caloriesExpended = <CaloriesExpended>[];
      json['calories_expended'].forEach((v) {
        caloriesExpended!.add(CaloriesExpended.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (caloriesExpended != null) {
      data['calories_expended'] =
          caloriesExpended!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaloriesExpended {
  int? value;
  String? startTimeMillis;
  String? endTimeMillis;
  String? startTime;
  String? endTime;

  CaloriesExpended(
      {this.value,
        this.startTimeMillis,
        this.endTimeMillis,
        this.startTime,
        this.endTime});

  CaloriesExpended.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    startTimeMillis = json['startTimeMillis'];
    endTimeMillis = json['endTimeMillis'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['startTimeMillis'] = startTimeMillis;
    data['endTimeMillis'] = endTimeMillis;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    return data;
  }
}
