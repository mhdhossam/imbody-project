class HealthDataModelHeartRate {
  List<HeartMinutes>? heartMinutes;

  HealthDataModelHeartRate({this.heartMinutes});

  HealthDataModelHeartRate.fromJson(Map<String, dynamic> json) {
    if (json['heart_minutes'] != null) {
      heartMinutes = <HeartMinutes>[];
      json['heart_minutes'].forEach((v) {
        heartMinutes!.add(HeartMinutes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (heartMinutes != null) {
      data['heart_minutes'] =
          heartMinutes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HeartMinutes {
  int? value;
  String? startTimeMillis;
  String? endTimeMillis;
  String? startTime;
  String? endTime;

  HeartMinutes(
      {this.value,
        this.startTimeMillis,
        this.endTimeMillis,
        this.startTime,
        this.endTime});

  HeartMinutes.fromJson(Map<String, dynamic> json) {
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
