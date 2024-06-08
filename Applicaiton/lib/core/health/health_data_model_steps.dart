class HealthDataModelSteps {
  List<StepsCount>? stepsCount;

  HealthDataModelSteps({this.stepsCount});

  HealthDataModelSteps.fromJson(Map<String, dynamic> json) {
    if (json['steps_count'] != null) {
      stepsCount = <StepsCount>[];
      json['steps_count'].forEach((v) {
        stepsCount!.add(StepsCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stepsCount != null) {
      data['steps_count'] = stepsCount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StepsCount {
  int? value;
  String? startTimeMillis;
  String? endTimeMillis;
  String? startTime;
  String? endTime;

  StepsCount(
      {this.value,
        this.startTimeMillis,
        this.endTimeMillis,
        this.startTime,
        this.endTime});

  StepsCount.fromJson(Map<String, dynamic> json) {
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
